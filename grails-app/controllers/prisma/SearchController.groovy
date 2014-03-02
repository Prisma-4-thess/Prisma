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

	def searchgeneral(){
		println params.subject
		println params.type
		println params.tag
		println params.fromDate
		println params.toDate
		println params.fromDate

		def decision = new Decision()
		def c = Decision.createCriteria()
		if(!params.tag.empty){
			decision = c.list {
				like("subject","%"+params.subject+"%") &&
						type{
							like("label","%"+params.type+"%")
						} &&
						tags{
							like("label","%"+params.tag+"%")
						} &&
						le("date",params.toDate) &&
						ge("date",params.fromDate)
			}
		}else{
			decision = c.list {
				like("subject","%"+params.subject+"%") &&
						type{
							like("label","%"+params.type+"%")
						} &&
						le("date",params.toDate) &&
						ge("date",params.fromDate)
			}
		}
		[results:decision]
	}
}
