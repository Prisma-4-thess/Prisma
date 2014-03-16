package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class MapController {
	static scope = "session"
	def decisions = new Decision()
	def offset = "0"
	def static maxToShow = 10
	
	def index() {
		def decisionG=new Decision()
		decisionG=Decision.createCriteria().list{ isNotNull("geo") }
		println 'size'+decisionG.size()
		def lat,lon,dr,ds
		def marker=new Map[decisionG.size()]
		int i=0
		decisionG.each{ dec ->
			lat=dec.geo.latitude
			lon=dec.geo.longitude
			dr=false
			ds='<a href="'+grailsApplication.config.grails.serverURL+'Prisma/search/show/'+dec.id+'/?source=map'+'" target="_blank">'+dec.ada+'</a>'
			marker[i] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
			i++
		}

		/*lat=40.636
		 lon=22.938
		 dr=false
		 marker[0] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
		 lat=40.65
		 lon=22.92
		 dr=false
		 ds='πλατεία τζομπανογλου'
		 marker[1] = [latitude:lat, longitude:lon, draggable:dr,description:ds]*/
		[mark:marker]
	}
	
	def homepage() {
		def decisionG=new Decision()
		decisionG=Decision.createCriteria().list{ isNotNull("geo") }
		println 'size: '+decisionG.size()
		def lat,lon,dr,ds
		def marker=new Map[decisionG.size()]
		int i=0
		decisionG.each{ dec ->
			lat=dec.geo.latitude
			lon=dec.geo.longitude
			dr=false
			ds='<a href="'+grailsApplication.config.grails.serverURL+'/map/show_geo/'+dec.geo.id+'/?source=map'+'" target="_blank">'+dec.geo+'</a>'
			marker[i] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
			i++
		}
		render(template:"/common/map", model:[mark:marker])
	}
	def show_geo(){
		//def decisions=new Decision()
		decisions=Decision.createCriteria().list{
			geo{
				eq("id",params.id.toLong())
			}
			order("date","desc")
		}
		def toShow = Math.min(maxToShow, decisions.size())
		render(view:"/map/markerList", model:[results:decisions.subList(0, toShow),decisionInstanceTotal:decisions.size(),source:"map"])
	}
	
	def list() {
		
				offset=params.offset
				def toShow = Math.min(Math.abs(decisions.size() - params.offset.toInteger()),maxToShow)
				println "toShow: "+toShow
				println "remaining: "+ (decisions.size())
				println "source: "+params.source
				render (template:"/common/decision_list", model:[results:decisions.subList(params.offset.toInteger(),params.offset.toInteger() + toShow), decisionInstanceTotal:(decisions.size()), source:params.source])
			}
}
