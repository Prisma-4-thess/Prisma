package prisma
import org.grails.datastore.gorm.finders.MethodExpression.IsNull;
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

		def decision = new Decision()
		def c = Decision.createCriteria()

		decision = c.list {

			like("subject","%"+params.subject+"%")
			type{
				like("label","%"+params.type+"%")
			}
			if(!params.tag.empty){
				tags{
					like("label","%"+params.tag+"%")
				}
			}
			if(params.toDate!=null){
				le("date",params.toDate)
			}
			if(params.fromDate!=null){
				ge("date",params.fromDate)
			}
		}
		[results:decision]
	}

	def searchspecific(){

		println params.prot_num
		println params.unit
		println params.org
		println params.signer_first
		println params.signer_last
		println params.fromDate
		println params.toDate

		def decision = new Decision()
		def c = Decision.createCriteria()

		decision = c.list {
			if(!params.prot_num.empty){
				like("protocolNumber","%"+params.prot_num+"%")
			}
			unit{
				like("label","%"+params.unit+"%")
			}
			unit{
				organization{
					like("label","%"+params.org+"%")
				}
			}
			signer{
				if(!params.signer_first.empty) like("firstName","%"+params.signer_first+"%")
				if(!params.signer_last.empty) like("lastName","%"+params.signer_last+"%")
			}
			if(params.toDate!=null){
				le("date",params.toDate)
			}
			if(params.fromDate!=null){
				ge("date",params.fromDate)
			}
		}
		[results:decision]
	}
}
