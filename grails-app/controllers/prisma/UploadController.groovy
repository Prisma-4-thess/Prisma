package prisma
import com.lucastex.grails.fileuploader.UFile
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class UploadController {

    def index() { }
	def error(){
	}
	def success(){
		def d=new Decision();
		println params.ada
		d.ada=params.ada;
		d.date=new Date();
		d.documentUrl=params.path
		d.protocolNumber=params.prot
		d.save(flush: true,failOnError:true)
	}
}
