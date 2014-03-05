package prisma
import com.lucastex.grails.fileuploader.UFile
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class UploadController {

	def index() {
		[typ:Type.list(),tag:Tag.list(),un:Unit.list(),sign:Signer.list()]
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
		dec.ada=params.ada
		f.transferTo(new File('web-app/pdf/'+params.ada))
		dec.protocolNumber=params.prot
		dec.subject=params.subject
		def (first,last)=params.signer.tokenize(' ')
		dec.type=Type.createCriteria().get{eq("label",params.type)}
		dec.unit=Unit.createCriteria().get{eq("label",params.unit)}
		dec.tags=Tag.createCriteria().list{eq("label",params.tag)}
		dec.signer=Signer.createCriteria().get{
			eq("firstName",first)
			eq("lastName",last)
		}
		//		dec.date=Date.fromString(params.date)
		dec.date = params.date
		dec.documentUrl=params.ada
		dec.url='pdf/'+params.ada
		dec.save(flush: true,failOnError:true)
		response.sendError(200, 'Done')
	}
}
