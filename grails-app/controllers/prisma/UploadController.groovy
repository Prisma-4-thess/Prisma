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
		d.ada=params.ada;
		d.save(flush: true,failOnError:true)
	}
}
