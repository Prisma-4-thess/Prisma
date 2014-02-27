package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class OrganizationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [organizationInstanceList: Organization.list(params), organizationInstanceTotal: Organization.count()]
    }

    def create() {
        [organizationInstance: new Organization(params)]
    }

    def save() {
        def organizationInstance = new Organization(params)
        if (!organizationInstance.save(flush: true)) {
            render(view: "create", model: [organizationInstance: organizationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'organization.label', default: 'Organization'), organizationInstance.id])
        redirect(action: "show", id: organizationInstance.id)
    }

    def show(Long id) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        [organizationInstance: organizationInstance]
    }

    def edit(Long id) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        [organizationInstance: organizationInstance]
    }

    def update(Long id, Long version) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (organizationInstance.version > version) {
                organizationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'organization.label', default: 'Organization')] as Object[],
                          "Another user has updated this Organization while you were editing")
                render(view: "edit", model: [organizationInstance: organizationInstance])
                return
            }
        }

        organizationInstance.properties = params

        if (!organizationInstance.save(flush: true)) {
            render(view: "edit", model: [organizationInstance: organizationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'organization.label', default: 'Organization'), organizationInstance.id])
        redirect(action: "show", id: organizationInstance.id)
    }

    def delete(Long id) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        try {
            organizationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "show", id: id)
        }
    }
}
