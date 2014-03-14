package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class ContactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contactInstanceList: Contact.list(params), contactInstanceTotal: Contact.count()]
    }

    def create() {
        [contactInstance: new Contact(params)]
    }

    def save() {
        def contactInstance = new Contact(params)
        if (!contactInstance.save(flush: true)) {
            render(view: "create", model: [contactInstance: contactInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
        redirect(action: "show", id: contactInstance.id)
    }

    def show(Long id) {
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        [contactInstance: contactInstance]
    }

    def edit(Long id) {
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        [contactInstance: contactInstance]
    }

    def update(Long id, Long version) {
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contactInstance.version > version) {
                contactInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contact.label', default: 'Contact')] as Object[],
                          "Another user has updated this Contact while you were editing")
                render(view: "edit", model: [contactInstance: contactInstance])
                return
            }
        }

        contactInstance.properties = params

        if (!contactInstance.save(flush: true)) {
            render(view: "edit", model: [contactInstance: contactInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
        redirect(action: "show", id: contactInstance.id)
    }

    def delete(Long id) {
        def contactInstance = Contact.get(id)
        if (!contactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
            return
        }

        try {
            contactInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), id])
            redirect(action: "show", id: id)
        }
    }
}
