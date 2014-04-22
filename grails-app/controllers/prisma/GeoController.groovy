package prisma

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN', 'ROLE_UPLOADER'])
class GeoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [geoInstanceList: Geo.list(params), geoInstanceTotal: Geo.count()]
    }

    def create() {
        [geoInstance: new Geo(params)]
    }

    def save() {
        def geoInstance = new Geo(params)
        if (!geoInstance.save(flush: true)) {
            render(view: "create", model: [geoInstance: geoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'geo.label', default: 'Geo'), geoInstance.id])
        redirect(action: "show", id: geoInstance.id)
    }

    def show(Long id) {
        def geoInstance = Geo.get(id)
        if (!geoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geo.label', default: 'Geo'), id])
            redirect(action: "list")
            return
        }

        [geoInstance: geoInstance]
    }

    def edit(Long id) {
        def geoInstance = Geo.get(id)
        if (!geoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geo.label', default: 'Geo'), id])
            redirect(action: "list")
            return
        }

        [geoInstance: geoInstance]
    }

    def update(Long id, Long version) {
        def geoInstance = Geo.get(id)
        if (!geoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geo.label', default: 'Geo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (geoInstance.version > version) {
                geoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'geo.label', default: 'Geo')] as Object[],
                        "Another user has updated this Geo while you were editing")
                render(view: "edit", model: [geoInstance: geoInstance])
                return
            }
        }

        geoInstance.properties = params

        if (!geoInstance.save(flush: true)) {
            render(view: "edit", model: [geoInstance: geoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'geo.label', default: 'Geo'), geoInstance.id])
        redirect(action: "show", id: geoInstance.id)
    }

    def delete(Long id) {
        def geoInstance = Geo.get(id)
        if (!geoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'geo.label', default: 'Geo'), id])
            redirect(action: "list")
            return
        }

        try {
            geoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'geo.label', default: 'Geo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'geo.label', default: 'Geo'), id])
            redirect(action: "show", id: id)
        }
    }
}
