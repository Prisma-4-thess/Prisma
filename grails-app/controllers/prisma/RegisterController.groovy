package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class RegisterController {

    def index() { 
		
	}
	def insert(){
		def user=new User()
		user
	}
}
