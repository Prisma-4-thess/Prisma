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
		decision = c.list {like("ada","%"+params.ada+"%")}
		[results:decision, decisionInstanceTotal: decision.size()]
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
		[results:decision, decisionInstanceTotal: decision.size()]
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
		[results:decision, decisionInstanceTotal: decision.size()]
	}
	def searchfull(){
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
		}
		[results:decision, decisionInstanceTotal: decision.size()]
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

		[decision:dec,ext:dec_ext,org:org,dec2:dec2]
	}
	def pdf(){
	}
}

