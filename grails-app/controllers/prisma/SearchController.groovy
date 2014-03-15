package prisma
import org.grails.datastore.gorm.finders.MethodExpression.IsNull;
import org.grails.datastore.gorm.finders.MethodExpression.Like;
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class SearchController {
	static scope = "session"
	def decision = new Decision()
	def offset = "0"
	def static maxToShow = 10
	def static maxResults = 500

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

		decision = new Decision()
		offset = "0"
		def c = Decision.createCriteria()
		decision = c.list {
			like("ada","%"+params.ada+"%")
			maxResults(maxResults)
		}
		def toShow = Math.min(maxToShow, decision.size())
		println "toShow: "+toShow


		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
	}

	def searchgeneral(Integer max){

		/*println "subject: "+params.subject
		 println "type: "+params.type
		 println "tag: "+params.tag
		 println "fromDate: "+params.fromDate
		 println "toDate: "+params.toDate*/

		decision = new Decision()
		offset = "0"
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
			maxResults(maxResults)
		}
		def toShow = Math.min(maxToShow, decision.size())
		println "toShow: "+toShow

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
		//					[results:decision, decisionInstanceTotal:decision.size()]

	}

	def searchspecific(){

		/*println params.prot_num
		 println params.unit
		 println params.org
		 println params.signer_first
		 println params.signer_last
		 println params.fromDate
		 println params.toDate*/

		decision = new Decision()
		offset = "0"
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
			maxResults(maxResults)
		}

		def toShow = Math.min(maxToShow, decision.size())
		println "toShow: "+toShow

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size()]
	}
	def searchfull(){


		//		println "numberOfResults: "+params.numberOfResults
		decision = new Decision()
		offset = "0"
		def (first,last)=params.signer.tokenize(' ')
		def c = Decision.createCriteria()

		decision = c.list {

			like("ada","%"+params.ada+"%")
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
			maxResults(maxResults)
		}
		def toShow = Math.min(maxToShow, decision.size())
		println "toShow: "+toShow
		println "source: "+params.pageId

		[results:decision.subList(0, toShow), decisionInstanceTotal:decision.size(), source:params.pageId]
	}
	def show(){
		println params.source
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
				eq("id",dec.unit.id)
			}
		}

		def dec2=new Decision()
		dec2=Decision.createCriteria().list{
			decisionToCorrect{
				eq("ada",dec.ada)
			}
		}

		def relativeDecisions = new RelativeDecision()
		relativeDecisions = RelativeDecision.createCriteria().list{ eq("finalDec",dec) }
		//println "relative decisions: "+relativeDecisions.relatedDec
		[decision:dec,ext:dec_ext,org:org,dec2:dec2,relDec:relativeDecisions.relatedDec,source:params.source]
	}
	def showRelated(){

		def dec=Decision.get(params.decisionId)
		def relativeDecisions = new RelativeDecision()
		relativeDecisions = RelativeDecision.createCriteria().list{ eq("finalDec",dec) }
		println "decision: "+ dec+" related: "+ relativeDecisions.relatedDec
		[dec:dec,relDec:relativeDecisions.relatedDec]
	}

	def list() {

		offset=params.offset
		def toShow = Math.min(Math.abs(decision.size() - params.offset.toInteger()),maxToShow)
		println "toShow: "+toShow
		println "remaining: "+ (decision.size())
		println "source: "+params.source
		render (template:"/common/decision_list", model:[results:decision.subList(params.offset.toInteger(),params.offset.toInteger() + toShow), decisionInstanceTotal:(decision.size()), source:params.source])
	}

	def sort(){

		/*def c = Decision.createCriteria()
		 decision = c.list {
		 eq("ada",decision.ada)
		 order(params.sort,params.order)
		 }*/

		//		decision = decision.ada.sort{it.size()}
		//		def sortedDecisions = Decision.list(params)
		if(offset==null) offset="0";
		def c = Decision.createCriteria()
		decision = c.list {
			'in'("ada",decision.ada)
			order(params.sort,params.order)
		}


		def toShow = Math.min(Math.abs(decision.size() - offset.toInteger()),maxToShow)
		println offset+":"+toShow
		render (template:"/common/table_results", model:[results:decision.subList(offset.toInteger(),offset.toInteger() + toShow), decisionInstanceTotal:(decision.size()), source:params.source])
	}
	def blog(){
		def posts=new Post()
		posts=Post.createCriteria().list {
			decision{
				eq("ada",params.id)
			}
		}
		[posts:posts,ada:params.id]
	}
	def postit(){
		def post=new Post()
		println 'text'+params.text
		post.firstName=params.first
		post.lastName=params.last
		post.text=params.text
		post.decision=Decision.findByAda(params.ada)
		post.save(flush: true,failOnError:true)
		def posts=new Post()
		posts=Post.createCriteria().list {
			decision{
				eq("ada",params.ada)
			}
		}
		[posts:posts]
	}
}

