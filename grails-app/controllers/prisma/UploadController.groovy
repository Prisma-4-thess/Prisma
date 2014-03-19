package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_UPLOADER'])
class UploadController {

	def index() {
		def marker=new Map[1]
		def address = [latitude:'40', longitude:'36']
		[typ:Type.list(),tag:Tag.list(),un:Unit.list(),geo:Geo.list()]
	}
	def geoDef(){
		
	}
	def error(){
	}
	def upload(){
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'index')
			return
		}
		def dec=new Decision()
		println 'lat: '+params.lat
		def predGeo=Geo.createCriteria().get{
			and{
				eq('latitude',params.lat.toDouble())
				eq('longitude',params.lng.toDouble())
				eq('namegrk',params.namegrk)
			}
		}
		if(predGeo!=null){
			dec.geo=predGeo
		}else{
			def geo1=new Geo()
			geo1.latitude=params.lat
			geo1.longitude=params.lng
			geo1.address=params.address
			geo1.namegrk=params.namegrk
			dec.geo=geo1
		}
		dec.ada=params.ada
		f.transferTo(new File('web-app/pdf/'+params.ada))
		dec.protocolNumber=params.prot
		dec.subject=params.subject
		def (first,last)=params.signer.tokenize(' ')
		dec.type=Type.createCriteria().get{eq("label",params.type)}
		dec.unit=Unit.createCriteria().get{
			and{
				organization{
					eq("label",params.org)
				}
				eq("label",params.unit)
			}
		}
		dec.tags=Tag.createCriteria().list{eq("label",params.tag)}
		dec.signer=Signer.createCriteria().get{
			and{
				eq("firstName",first)
				eq("lastName",last)
			}
		}
		//		dec.date=Date.fromString(params.date)
		dec.date = params.date
		dec.documentUrl=params.ada
		dec.url='pdf/'+params.ada
		dec.save(flush: true)
		render (view:"success", model:[documentUrl:params.ada])

	}
}
