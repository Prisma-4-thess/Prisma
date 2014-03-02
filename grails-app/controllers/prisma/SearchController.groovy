package prisma
import org.grails.datastore.gorm.finders.MethodExpression.Like;

import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class SearchController {

	def index() {
	}
	def ada(){

	}
	def specific(){

	}
	def general(){

	}
	def full_search(){

	}
	def searchada(){
		println params.ada
		def decision = new Decision()
		def c = Decision.createCriteria()
		decision = c.list {like(params.ada,"ada")}
		[results:decision]
	}
}
