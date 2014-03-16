package prisma
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
@Secured(['ROLE_ADMIN','ROLE_USER','ROLE_MODERATOR','ROLE_UPLOADER'])
class Select_panelController {

	def index() {
	}
	def select(){
		if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
			redirect controller:'admin_panel'
		}
		if (SpringSecurityUtils.ifAllGranted('ROLE_MODERATOR')) {
			redirect controller:'mod_panel'
		}
		if (SpringSecurityUtils.ifAllGranted('ROLE_UPLOADER')) {
			redirect controller:'up_panel'
		}
		if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
			redirect(uri: "/")
		}
	}
}
