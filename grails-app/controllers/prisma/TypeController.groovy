package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class TypeController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[typeInstanceList: Type.list(params), typeInstanceTotal: Type.count()]
	}

	def create() {
		[typeInstance: new Type(params)]
	}

	def save() {
		def typeInstance = new Type(params)
		if (!typeInstance.save(flush: true)) {
			render(view: "create", model: [typeInstance: typeInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'type.label', default: 'Type'),
			typeInstance.id
		])
		redirect(action: "show", id: typeInstance.id)
	}

	def show(Long id) {
		def typeInstance = Type.get(id)
		if (!typeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'type.label', default: 'Type'),
				id
			])
			redirect(action: "list")
			return
		}

		[typeInstance: typeInstance]
	}

	def edit(Long id) {
		def typeInstance = Type.get(id)
		if (!typeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'type.label', default: 'Type'),
				id
			])
			redirect(action: "list")
			return
		}

		[typeInstance: typeInstance]
	}

	def update(Long id, Long version) {
		def typeInstance = Type.get(id)
		if (!typeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'type.label', default: 'Type'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (typeInstance.version > version) {
				typeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'type.label', default: 'Type')] as Object[],
						"Another user has updated this Type while you were editing")
				render(view: "edit", model: [typeInstance: typeInstance])
				return
			}
		}

		typeInstance.properties = params

		if (!typeInstance.save(flush: true)) {
			render(view: "edit", model: [typeInstance: typeInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'type.label', default: 'Type'),
			typeInstance.id
		])
		redirect(action: "show", id: typeInstance.id)
	}

	def delete(Long id) {
		def typeInstance = Type.get(id)
		if (!typeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'type.label', default: 'Type'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			typeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'type.label', default: 'Type'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'type.label', default: 'Type'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
