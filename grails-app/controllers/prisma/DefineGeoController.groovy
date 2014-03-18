package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class DefineGeoController {
	def thres = 0.0015
	def index() {
	}
	def submitGeo(){
		def predGeo=Geo.createCriteria().get{
			and{
			eq('latitude',params.lat.toDouble())
			eq('longitude',params.lng.toDouble())
			eq('namegrk',params.namegrk)
			}
		}
		if(predGeo==null){
			def udg=new Userdefgeo()
			udg.latitude=params.lat.toDouble()
			udg.longitude=params.lng.toDouble()
			udg.address=params.address
			udg.namegrk=params.namegrk
			try{
				udg.save(flush:true)
				def udd=new Userdefdec()
				udd.decision=Decision.get(params.decisionId.toLong())
				udd.geo=udg
				udd.save(flush:true)
				[mes:'Η καταχώρηση πραγματοποιήθηκε επιτυχώς.']
			}catch (Exception e){
				[mes:'Η καταχώρηση απέτυχε. Συμπληρώστε όλα τα πεδία.']
			}
		}else{
			def predefined=new Predefined()
			predefined.decision=Decision.get(params.decisionId.toLong())
			predefined.geo=predGeo
		}
	}
	def nearGeo(){
		def geos=[]
		println "nearGeo: "+params.lat+","+params.lng
		def geo=Geo.all
		geo.each {g->
			if(Math.abs(g.latitude-params.lat.toDouble())<thres && Math.abs(g.longitude-params.lng.toDouble())<thres){
				println "Geo Added"
				geos.add(g)
			}
		}
		[geo:geos]
	}
}
