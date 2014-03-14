package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class ApproveController {

    def index() {
		redirect(action:approve)
	}
	def approve(){
		def preDecToAp=new Predefined()
		def userDecToAp=new Userdefdec()
		def userGeoToAp=new Userdefgeo()
		[pre:Predefined.all,udd:Userdefdec.all,udg:Userdefgeo.all]
	}
}
