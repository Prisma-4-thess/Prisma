package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class MapController {
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
			ds='<a href="'+grailsApplication.config.grails.serverURL+'Prisma/search/show/'+dec.id+'">'+dec.ada+'</a>'
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
}
