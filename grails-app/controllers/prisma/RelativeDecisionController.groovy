package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class RelativeDecisionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [relativeDecisionInstanceList: RelativeDecision.list(params), relativeDecisionInstanceTotal: RelativeDecision.count()]
    }

    def create() {
        [relativeDecisionInstance: new RelativeDecision(params)]
    }

    def save() {
        def relativeDecisionInstance = new RelativeDecision(params)
        if (!relativeDecisionInstance.save(flush: true)) {
            render(view: "create", model: [relativeDecisionInstance: relativeDecisionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), relativeDecisionInstance.id])
        redirect(action: "show", id: relativeDecisionInstance.id)
    }

    def show(Long id) {
        def relativeDecisionInstance = RelativeDecision.get(id)
        if (!relativeDecisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), id])
            redirect(action: "list")
            return
        }

        [relativeDecisionInstance: relativeDecisionInstance]
    }

    def edit(Long id) {
        def relativeDecisionInstance = RelativeDecision.get(id)
        if (!relativeDecisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), id])
            redirect(action: "list")
            return
        }

        [relativeDecisionInstance: relativeDecisionInstance]
    }

    def update(Long id, Long version) {
        def relativeDecisionInstance = RelativeDecision.get(id)
        if (!relativeDecisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (relativeDecisionInstance.version > version) {
                relativeDecisionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'relativeDecision.label', default: 'RelativeDecision')] as Object[],
                          "Another user has updated this RelativeDecision while you were editing")
                render(view: "edit", model: [relativeDecisionInstance: relativeDecisionInstance])
                return
            }
        }

        relativeDecisionInstance.properties = params

        if (!relativeDecisionInstance.save(flush: true)) {
            render(view: "edit", model: [relativeDecisionInstance: relativeDecisionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), relativeDecisionInstance.id])
        redirect(action: "show", id: relativeDecisionInstance.id)
    }

    def delete(Long id) {
        def relativeDecisionInstance = RelativeDecision.get(id)
        if (!relativeDecisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), id])
            redirect(action: "list")
            return
        }

        try {
            relativeDecisionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'relativeDecision.label', default: 'RelativeDecision'), id])
            redirect(action: "show", id: id)
        }
    }
}
