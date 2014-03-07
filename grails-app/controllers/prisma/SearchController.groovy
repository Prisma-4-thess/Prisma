package prisma
import org.grails.datastore.gorm.finders.MethodExpression.IsNull;
import org.grails.datastore.gorm.finders.MethodExpression.Like;

import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class SearchController {
	def static decision = new Decision()

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

		//		println "numberOfResults: "+params.numberOfResults
		decision = new Decision()
		def c = Decision.createCriteria()
		decision = c.list {like("ada","%"+params.ada+"%")}

		def toShow = Math.min(params.maxToShow.toInteger(), decision.size())
		println "numberOfResults: "+params.numberOfResults

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
	}

	def searchgeneral(Integer max){

		println "subject: "+params.subject
		println "type: "+params.type
		println "tag: "+params.tag
		println "fromDate: "+params.fromDate
		println "toDate: "+params.toDate

		decision = new Decision()

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
		def toShow = Math.min(params.maxToShow.toInteger(), decision.size())
		println "numberOfResults: "+params.numberOfResults

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
		//					[results:decision, decisionInstanceTotal:decision.size()]

	}

	def searchspecific(){

		println params.prot_num
		println params.unit
		println params.org
		println params.signer_first
		println params.signer_last
		println params.fromDate
		println params.toDate


		decision = new Decision()
		def (first,last)=params.signer.tokenize(' ')

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
				if(!params.signer.empty) like("firstName","%"+first+"%")
				if(!params.signer.empty) like("lastName","%"+last+"%")
			}
			if(params.toDate!=null){
				le("date",params.toDate)
			}
			if(params.fromDate!=null){
				ge("date",params.fromDate)
			}
		}

		def toShow = Math.min(params.maxToShow.toInteger(), decision.size())
		println "numberOfResults: "+params.numberOfResults

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
	}
	def searchfull(){


		//		println "numberOfResults: "+params.numberOfResults
		decision = new Decision()
		def (first,last)=params.signer.tokenize(' ')
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
				if(!params.signer.empty) like("firstName","%"+first+"%")
				if(!params.signer.empty) like("lastName","%"+last+"%")
			}
		}
		def toShow = Math.min(params.maxToShow.toInteger(), decision.size())
		println "numberOfResults: "+params.numberOfResults

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
	}
	def show(){
		def dec=Decision.get(params.id)
		def dec_ext=new Decision_ext()
		dec_ext=Decision_ext.createCriteria().list {
			decision{
				eq("ada",dec.ada)
			}
		}

		def org=new Organization()
		org=Organization.createCriteria().get {
			units{
				eq("label",dec.unit.label)
			}
		}

		def dec2=new Decision()
		dec2=Decision.createCriteria().get{
			decisionToCorrect{
				eq("ada",dec.ada)
			}
		}
		params.max = 10
		[decision:dec,ext:dec_ext,org:org,dec2:dec2]
	}

	def list(Integer max) {
		println "max: "+max
		println "offset: "+params.offset
		def toShow = Math.min(Math.abs(decision.size() - params.offset.toInteger()),max)
		//		[results:decision.subList(params.offset.toInteger(),params.offset.toInteger() + params.max), decisionInstanceTotal:decision.size()]
		render (template:"/common/decision_list", model:[results:decision.subList(params.offset.toInteger(),params.offset.toInteger() + toShow), decisionInstanceTotal:decision.size()-params.offset.toInteger()])
		//		render (template:"/common/decision_list", model:[results:decision])
	}
}

