package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class UploadController {

	def index() {
		 def marker=new Map[1]
		def address = [latitude:'40', longitude:'36']
		[typ:Type.list(),tag:Tag.list(),un:Unit.list(),geo:Geo.list()]
	}
	def error(){
	}
	def upload(){
		println 'lat'+params.latitude
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'index')
			return
		}
		def dec=new Decision()
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
		dec.geo=Geo.findByNamegrk(params.geo)
		dec.url='pdf/'+params.ada
		dec.save(flush: true,failOnError:true)
		render (view:"success", model:[documentUrl:params.ada])

	}
	
}
