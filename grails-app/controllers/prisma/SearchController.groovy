package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class SearchController {

    def index() { }
	def ada(){}
	def sub(){}
	def signer(){}
	def prot(){}
	def tag(){}
	def searchada(){
		println params.ada
	}
}
