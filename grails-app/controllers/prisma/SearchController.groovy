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
		def decision = new Decision()
		def c = Decision.createCriteria()
		decision = c.get {eq("ada",params.ada)}
		[result:decision]
	}
}
