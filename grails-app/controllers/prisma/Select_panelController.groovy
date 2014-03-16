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
			println "admin"
			redirect mapping:'adminPanel'
		}
		if (SpringSecurityUtils.ifAllGranted('ROLE_MODERATOR')) {
			redirect mapping:'modPanel'
		}
		if (SpringSecurityUtils.ifAllGranted('ROLE_UPLOADER')) {
			redirect mapping:'upPanel'
		}
		if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
			println "user"
			redirect mapping:'rootUrl'
		}
	}
}
