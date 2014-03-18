package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class DefineGeoController {
def thres=0.001
	def index() {
	}
	def submitGeo(){
		if(params.defined_geo==null){
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
		}else{
		def pre=new Predefined()
		pre.decision=Decision.get(params.decisionId.toLong())
		pre.geo=Geo.findByNamegrk(params.defined_geo)
		}
	}
	def nearGeo(){
		def geos=[]
		def geo=Geo.all
		geo.each {g->
			if(Math.abs(g.latitude-params.lat)<thres&&Math.abs(g.longitude-params.lng)<thres){
				geos.add(g)
			}
		}
		[geo_list:geos]
	}
}
