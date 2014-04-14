package prisma

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN'])
class DecisionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [decisionInstanceList: Decision.list(params), decisionInstanceTotal: Decision.count()]
    }

    def create() {
        [decisionInstance: new Decision(params)]
    }

    def save() {
        def decisionInstance = new Decision(params)
        if (!decisionInstance.save(flush: true)) {
            render(view: "create", model: [decisionInstance: decisionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'decision.label', default: 'Decision'), decisionInstance.id])
        redirect(action: "show", id: decisionInstance.id)
    }

    def show(Long id) {
        def decisionInstance = Decision.get(id)
        if (!decisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'decision.label', default: 'Decision'), id])
            redirect(action: "list")
            return
        }

        [decisionInstance: decisionInstance]
    }

    def edit(Long id) {
        def decisionInstance = Decision.get(id)
        if (!decisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'decision.label', default: 'Decision'), id])
            redirect(action: "list")
            return
        }

        [decisionInstance: decisionInstance]
    }

    def update(Long id, Long version) {
        def decisionInstance = Decision.get(id)
        if (!decisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'decision.label', default: 'Decision'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (decisionInstance.version > version) {
                decisionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'decision.label', default: 'Decision')] as Object[],
                        "Another user has updated this Decision while you were editing")
                render(view: "edit", model: [decisionInstance: decisionInstance])
                return
            }
        }

        decisionInstance.properties = params

        if (!decisionInstance.save(flush: true)) {
            render(view: "edit", model: [decisionInstance: decisionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'decision.label', default: 'Decision'), decisionInstance.id])
        redirect(action: "show", id: decisionInstance.id)
    }

    def delete(Long id) {
        def decisionInstance = Decision.get(id)
        if (!decisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'decision.label', default: 'Decision'), id])
            redirect(action: "list")
            return
        }

        try {
            decisionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'decision.label', default: 'Decision'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'decision.label', default: 'Decision'), id])
            redirect(action: "show", id: id)
        }
    }
}
