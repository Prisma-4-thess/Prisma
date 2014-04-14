package prisma

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['permitAll'])
class PredefinedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [predefinedInstanceList: Predefined.list(params), predefinedInstanceTotal: Predefined.count()]
    }

    def create() {
        [predefinedInstance: new Predefined(params)]
    }

    def save() {
        def predefinedInstance = new Predefined(params)
        if (!predefinedInstance.save(flush: true)) {
            render(view: "create", model: [predefinedInstance: predefinedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'predefined.label', default: 'Predefined'), predefinedInstance.id])
        redirect(action: "show", id: predefinedInstance.id)
    }

    def show(Long id) {
        def predefinedInstance = Predefined.get(id)
        if (!predefinedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predefined.label', default: 'Predefined'), id])
            redirect(action: "list")
            return
        }

        [predefinedInstance: predefinedInstance]
    }

    def edit(Long id) {
        def predefinedInstance = Predefined.get(id)
        if (!predefinedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predefined.label', default: 'Predefined'), id])
            redirect(action: "list")
            return
        }

        [predefinedInstance: predefinedInstance]
    }

    def update(Long id, Long version) {
        def predefinedInstance = Predefined.get(id)
        if (!predefinedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predefined.label', default: 'Predefined'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (predefinedInstance.version > version) {
                predefinedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'predefined.label', default: 'Predefined')] as Object[],
                        "Another user has updated this Predefined while you were editing")
                render(view: "edit", model: [predefinedInstance: predefinedInstance])
                return
            }
        }

        predefinedInstance.properties = params

        if (!predefinedInstance.save(flush: true)) {
            render(view: "edit", model: [predefinedInstance: predefinedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'predefined.label', default: 'Predefined'), predefinedInstance.id])
        redirect(action: "show", id: predefinedInstance.id)
    }

    def delete(Long id) {
        def predefinedInstance = Predefined.get(id)
        if (!predefinedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predefined.label', default: 'Predefined'), id])
            redirect(action: "list")
            return
        }

        try {
            predefinedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'predefined.label', default: 'Predefined'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'predefined.label', default: 'Predefined'), id])
            redirect(action: "show", id: id)
        }
    }
}
