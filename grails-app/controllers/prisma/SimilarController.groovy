package prisma

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN'])
class SimilarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [similarInstanceList: Similar.list(params), similarInstanceTotal: Similar.count()]
    }

    def create() {
        [similarInstance: new Similar(params)]
    }

    def save() {
        def similarInstance = new Similar(params)
        if (!similarInstance.save(flush: true)) {
            render(view: "create", model: [similarInstance: similarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'similar.label', default: 'Similar'), similarInstance.id])
        redirect(action: "show", id: similarInstance.id)
    }

    def show(Long id) {
        def similarInstance = Similar.get(id)
        if (!similarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'similar.label', default: 'Similar'), id])
            redirect(action: "list")
            return
        }

        [similarInstance: similarInstance]
    }

    def edit(Long id) {
        def similarInstance = Similar.get(id)
        if (!similarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'similar.label', default: 'Similar'), id])
            redirect(action: "list")
            return
        }

        [similarInstance: similarInstance]
    }

    def update(Long id, Long version) {
        def similarInstance = Similar.get(id)
        if (!similarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'similar.label', default: 'Similar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (similarInstance.version > version) {
                similarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'similar.label', default: 'Similar')] as Object[],
                        "Another user has updated this Similar while you were editing")
                render(view: "edit", model: [similarInstance: similarInstance])
                return
            }
        }

        similarInstance.properties = params

        if (!similarInstance.save(flush: true)) {
            render(view: "edit", model: [similarInstance: similarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'similar.label', default: 'Similar'), similarInstance.id])
        redirect(action: "show", id: similarInstance.id)
    }

    def delete(Long id) {
        def similarInstance = Similar.get(id)
        if (!similarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'similar.label', default: 'Similar'), id])
            redirect(action: "list")
            return
        }

        try {
            similarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'similar.label', default: 'Similar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'similar.label', default: 'Similar'), id])
            redirect(action: "show", id: id)
        }
    }
}
