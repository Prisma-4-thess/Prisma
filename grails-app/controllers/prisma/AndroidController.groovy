package prisma
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class AndroidController {

	def index() {
		def geo=new Geo()
		geo=Geo.all
		def lat,lon,namegrk,geoid
		def marker=new Map[geo.size()]
		int i=0
		geo.each{ g ->
			geoid=g.id
			lat=g.latitude
			lon=g.longitude
			namegrk=g.namegrk
			marker[i] = [latitude:lat, longitude:lon, namegrk:namegrk,id:geoid]
			i++
		}
		def res= [marker:marker]
		render res as JSON
	}
	def rgeo(){
		println params.id

		def geoD=new Decision()
		geoD=Decision.createCriteria().list{
			geo{
				eq("id",params.id.toLong())
			}
		}
		def ada,sub,id
		def marker=new Map[geoD.size()]
		int i=0
		geoD.each{ g ->
			id=g.id
			ada=g.ada
			sub=g.subject
			marker[i] = [ada:ada,subject:sub,id:id]
			i++
		}
		def res= [marker:marker]
		render res as JSON
	}
	def show(){
		def marker=new Map[1]
		def dec=Decision.get(params.id)
		def dec_ext=new Decision_ext()
		dec_ext=Decision_ext.createCriteria().list {
			decision{
				eq("ada",dec.ada)
			}
		}

		def org=new Organization()
		org=Organization.createCriteria().get {
			units{
				eq("id",dec.unit.id)
			}
		}

		def dec2=new Decision()
		dec2=Decision.createCriteria().list{
			decisionToCorrect{
				eq("ada",dec.ada)
			}
		}

		marker[0] = [ada:dec.ada,subject:dec.subject,url:dec.documentUrl,unit:dec.unit.label,org:org.label]
		def res= [marker:marker]
		render res as JSON
	}
}
