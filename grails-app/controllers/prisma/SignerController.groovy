package prisma

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class SignerController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[signerInstanceList: Signer.list(params), signerInstanceTotal: Signer.count()]
	}

	def create() {
		[signerInstance: new Signer(params)]
	}

	def save() {
		def signerInstance = new Signer(params)
		if (!signerInstance.save(flush: true)) {
			render(view: "create", model: [signerInstance: signerInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'signer.label', default: 'Signer'),
			signerInstance.id
		])
		redirect(action: "show", id: signerInstance.id)
	}

	def show(Long id) {
		def signerInstance = Signer.get(id)
		if (!signerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'signer.label', default: 'Signer'),
				id
			])
			redirect(action: "list")
			return
		}

		[signerInstance: signerInstance]
	}

	def edit(Long id) {
		def signerInstance = Signer.get(id)
		if (!signerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'signer.label', default: 'Signer'),
				id
			])
			redirect(action: "list")
			return
		}

		[signerInstance: signerInstance]
	}

	def update(Long id, Long version) {
		def signerInstance = Signer.get(id)
		if (!signerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'signer.label', default: 'Signer'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (signerInstance.version > version) {
				signerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'signer.label', default: 'Signer')] as Object[],
						"Another user has updated this Signer while you were editing")
				render(view: "edit", model: [signerInstance: signerInstance])
				return
			}
		}

		signerInstance.properties = params

		if (!signerInstance.save(flush: true)) {
			render(view: "edit", model: [signerInstance: signerInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'signer.label', default: 'Signer'),
			signerInstance.id
		])
		redirect(action: "show", id: signerInstance.id)
	}

	def delete(Long id) {
		def signerInstance = Signer.get(id)
		if (!signerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'signer.label', default: 'Signer'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			signerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'signer.label', default: 'Signer'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'signer.label', default: 'Signer'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
