package prisma

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN'])
class ExtraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [extraInstanceList: Extra.list(params), extraInstanceTotal: Extra.count()]
    }

    def create() {
        [extraInstance: new Extra(params)]
    }

    def save() {
        def extraInstance = new Extra(params)
        if (!extraInstance.save(flush: true)) {
            render(view: "create", model: [extraInstance: extraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [
                message(code: 'extra.label', default: 'Extra'),
                extraInstance.id
        ])
        redirect(action: "show", id: extraInstance.id)
    }

    def show(Long id) {
        def extraInstance = Extra.get(id)
        if (!extraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [
                    message(code: 'extra.label', default: 'Extra'),
                    id
            ])
            redirect(action: "list")
            return
        }

        [extraInstance: extraInstance]
    }

    def edit(Long id) {
        def extraInstance = Extra.get(id)
        if (!extraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [
                    message(code: 'extra.label', default: 'Extra'),
                    id
            ])
            redirect(action: "list")
            return
        }

        [extraInstance: extraInstance]
    }

    def update(Long id, Long version) {
        def extraInstance = Extra.get(id)
        if (!extraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [
                    message(code: 'extra.label', default: 'Extra'),
                    id
            ])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (extraInstance.version > version) {
                extraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [
                                message(code: 'extra.label', default: 'Extra')] as Object[],
                        "Another user has updated this Extra while you were editing")
                render(view: "edit", model: [extraInstance: extraInstance])
                return
            }
        }

        extraInstance.properties = params

        if (!extraInstance.save(flush: true)) {
            render(view: "edit", model: [extraInstance: extraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [
                message(code: 'extra.label', default: 'Extra'),
                extraInstance.id
        ])
        redirect(action: "show", id: extraInstance.id)
    }

    def delete(Long id) {
        def extraInstance = Extra.get(id)
        if (!extraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [
                    message(code: 'extra.label', default: 'Extra'),
                    id
            ])
            redirect(action: "list")
            return
        }

        try {
            extraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [
                    message(code: 'extra.label', default: 'Extra'),
                    id
            ])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [
                    message(code: 'extra.label', default: 'Extra'),
                    id
            ])
            redirect(action: "show", id: id)
        }
    }
}
