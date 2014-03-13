package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class ContactController {

    def index() { 
		println params.name+" "+params.email+" "+params.message
	}
}
