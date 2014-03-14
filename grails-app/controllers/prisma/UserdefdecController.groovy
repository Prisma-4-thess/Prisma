package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class UserdefdecController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userdefdecInstanceList: Userdefdec.list(params), userdefdecInstanceTotal: Userdefdec.count()]
    }

    def create() {
        [userdefdecInstance: new Userdefdec(params)]
    }

    def save() {
        def userdefdecInstance = new Userdefdec(params)
        if (!userdefdecInstance.save(flush: true)) {
            render(view: "create", model: [userdefdecInstance: userdefdecInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), userdefdecInstance.id])
        redirect(action: "show", id: userdefdecInstance.id)
    }

    def show(Long id) {
        def userdefdecInstance = Userdefdec.get(id)
        if (!userdefdecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), id])
            redirect(action: "list")
            return
        }

        [userdefdecInstance: userdefdecInstance]
    }

    def edit(Long id) {
        def userdefdecInstance = Userdefdec.get(id)
        if (!userdefdecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), id])
            redirect(action: "list")
            return
        }

        [userdefdecInstance: userdefdecInstance]
    }

    def update(Long id, Long version) {
        def userdefdecInstance = Userdefdec.get(id)
        if (!userdefdecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userdefdecInstance.version > version) {
                userdefdecInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userdefdec.label', default: 'Userdefdec')] as Object[],
                          "Another user has updated this Userdefdec while you were editing")
                render(view: "edit", model: [userdefdecInstance: userdefdecInstance])
                return
            }
        }

        userdefdecInstance.properties = params

        if (!userdefdecInstance.save(flush: true)) {
            render(view: "edit", model: [userdefdecInstance: userdefdecInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), userdefdecInstance.id])
        redirect(action: "show", id: userdefdecInstance.id)
    }

    def delete(Long id) {
        def userdefdecInstance = Userdefdec.get(id)
        if (!userdefdecInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), id])
            redirect(action: "list")
            return
        }

        try {
            userdefdecInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userdefdec.label', default: 'Userdefdec'), id])
            redirect(action: "show", id: id)
        }
    }
}
