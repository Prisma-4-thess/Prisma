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
	def app_decision(){
		def pre=Predefined.get(params.id.toLong())
		def dec=Decision.findByAda(pre.decision.ada)
		dec.geo=Geo.findByNamegrk(pre.geo.namegrk)
		dec.save(flush:true,failOnError:true)
		pre.delete(flush:true)
	}
	def dis_decision(){
		def pre=Predefined.get(params.id.toLong())
		pre.delete(flush:true)
	}
}
