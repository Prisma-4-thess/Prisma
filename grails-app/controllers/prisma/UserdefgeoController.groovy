package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class UserdefgeoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userdefgeoInstanceList: Userdefgeo.list(params), userdefgeoInstanceTotal: Userdefgeo.count()]
    }

    def create() {
        [userdefgeoInstance: new Userdefgeo(params)]
    }

    def save() {
        def userdefgeoInstance = new Userdefgeo(params)
        if (!userdefgeoInstance.save(flush: true)) {
            render(view: "create", model: [userdefgeoInstance: userdefgeoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), userdefgeoInstance.id])
        redirect(action: "show", id: userdefgeoInstance.id)
    }

    def show(Long id) {
        def userdefgeoInstance = Userdefgeo.get(id)
        if (!userdefgeoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), id])
            redirect(action: "list")
            return
        }

        [userdefgeoInstance: userdefgeoInstance]
    }

    def edit(Long id) {
        def userdefgeoInstance = Userdefgeo.get(id)
        if (!userdefgeoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), id])
            redirect(action: "list")
            return
        }

        [userdefgeoInstance: userdefgeoInstance]
    }

    def update(Long id, Long version) {
        def userdefgeoInstance = Userdefgeo.get(id)
        if (!userdefgeoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userdefgeoInstance.version > version) {
                userdefgeoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userdefgeo.label', default: 'Userdefgeo')] as Object[],
                          "Another user has updated this Userdefgeo while you were editing")
                render(view: "edit", model: [userdefgeoInstance: userdefgeoInstance])
                return
            }
        }

        userdefgeoInstance.properties = params

        if (!userdefgeoInstance.save(flush: true)) {
            render(view: "edit", model: [userdefgeoInstance: userdefgeoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), userdefgeoInstance.id])
        redirect(action: "show", id: userdefgeoInstance.id)
    }

    def delete(Long id) {
        def userdefgeoInstance = Userdefgeo.get(id)
        if (!userdefgeoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), id])
            redirect(action: "list")
            return
        }

        try {
            userdefgeoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userdefgeo.label', default: 'Userdefgeo'), id])
            redirect(action: "show", id: id)
        }
    }
}
