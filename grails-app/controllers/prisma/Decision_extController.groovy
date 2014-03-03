package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class Decision_extController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[decision_extInstanceList: Decision_ext.list(params), decision_extInstanceTotal: Decision_ext.count()]
	}

	def create() {
		[decision_extInstance: new Decision_ext(params)]
	}

	def save() {
		def decision_extInstance = new Decision_ext(params)
		if (!decision_extInstance.save(flush: true)) {
			render(view: "create", model: [decision_extInstance: decision_extInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'decision_ext.label', default: 'Decision_ext'),
			decision_extInstance.id
		])
		redirect(action: "show", id: decision_extInstance.id)
	}

	def show(Long id) {
		def decision_extInstance = Decision_ext.get(id)
		if (!decision_extInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'decision_ext.label', default: 'Decision_ext'),
				id
			])
			redirect(action: "list")
			return
		}

		[decision_extInstance: decision_extInstance]
	}

	def edit(Long id) {
		def decision_extInstance = Decision_ext.get(id)
		if (!decision_extInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'decision_ext.label', default: 'Decision_ext'),
				id
			])
			redirect(action: "list")
			return
		}

		[decision_extInstance: decision_extInstance]
	}

	def update(Long id, Long version) {
		def decision_extInstance = Decision_ext.get(id)
		if (!decision_extInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'decision_ext.label', default: 'Decision_ext'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (decision_extInstance.version > version) {
				decision_extInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'decision_ext.label', default: 'Decision_ext')] as Object[],
						"Another user has updated this Decision_ext while you were editing")
				render(view: "edit", model: [decision_extInstance: decision_extInstance])
				return
			}
		}

		decision_extInstance.properties = params

		if (!decision_extInstance.save(flush: true)) {
			render(view: "edit", model: [decision_extInstance: decision_extInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'decision_ext.label', default: 'Decision_ext'),
			decision_extInstance.id
		])
		redirect(action: "show", id: decision_extInstance.id)
	}

	def delete(Long id) {
		def decision_extInstance = Decision_ext.get(id)
		if (!decision_extInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'decision_ext.label', default: 'Decision_ext'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			decision_extInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'decision_ext.label', default: 'Decision_ext'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'decision_ext.label', default: 'Decision_ext'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
