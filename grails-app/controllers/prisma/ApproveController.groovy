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
		[pre:Predefined.all,udd:Userdefdec.all]
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
	def examine(){
		def geo=new Userdefgeo()
		Userdefdec dec=Userdefdec.get(params.id)
		def marker=new Map[1]
		marker[0] = [latitude:dec.geo.latitude, longitude:dec.geo.longitude, draggable:false,description:dec.geo.namegrk]
		[mark:marker,geo_id:dec.geo.id]
	}
	def geo_approved(){
		def u_geo=Userdefgeo.get(params.id)
		def geo1=new Geo()
		geo1.latitude=u_geo.latitude
		geo1.longitude=u_geo.longitude
		geo1.namegrk=u_geo.namegrk
		geo1.address=u_geo.address
		geo1.save(flush:true)
		def decisions=new Userdefdec()
		decisions=Userdefdec.createCriteria().list {
			geo{
				eq("id",params.id.toLong())
			}
		}
		[decs:decisions,geo_id:geo1.id,old_geo_id:params.id]
	}
	def u_app_decision(){
		def dec=Userdefdec.get(params.id.toLong())
		def dec2=Decision.findByAda(dec.decision.ada)
		dec2.geo=Geo.get(params.geo_id.toLong())
		dec2.save(flush:true)
		dec.delete()
		def decsLeft=Userdefdec.createCriteria().list{
			geo{
				eq("id",params.geo_id.toLong())
			}
		}
		println params.old_geo_id
		if(decsLeft.empty){
			def geo1=Userdefgeo.get(params.old_geo_id)
			geo1.delete(flush:true)
		}
	}
	def u_dis_decision(){
		def dec=Userdefdec.get(params.id.toLong())
		dec.delete()
		def decsLeft=Userdefdec.createCriteria().list{
			geo{
				eq("id",params.geo_id.toLong())
			}
		}
		if(decsLeft.empty){
			def geo1=Userdefgeo.get(params.old_geo_id)
			geo1.delete(flush:true)
		}
	}
}
