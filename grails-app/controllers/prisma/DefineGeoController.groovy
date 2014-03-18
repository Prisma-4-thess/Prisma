package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class DefineGeoController {

    def index() { 
	}
	def submitGeo(){
		def udg=new Userdefgeo()
		udg.latitude=params.lat.toDouble()
		udg.longitude=params.lng.toDouble()
		udg.address=params.address
		udg.namegrk=params.namegrk
		udg.save(flush:true)
		def udd=new Userdefdec()
		udd.decision=Decision.get(params.decisionId.toLong())
		udd.geo=udg
		udd.save(flush:true)
	}
}
