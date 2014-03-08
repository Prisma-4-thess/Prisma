package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class AjaxController {

	def index() {
	}
	def signerAJAX(){
		def signers=new Signer()
		if(params.query.contains(" ")){
			def (query1,query2)=params.query.tokenize()
			signers = Signer.createCriteria().list{
				or{
					like("firstName",query1+"%")
					like("lastName",query2+"%")
					like("firstName",query2+"%")
					like("lastName",query1+"%")
				}
				maxResults(10)
			}
			
		}else{
		signers = Signer.createCriteria().list{
			or{
				like("firstName",params.query+"%")
				like("lastName",params.query+"%")
			}
			maxResults(10)
		}
		}
		

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				signers.each { signer ->
					result(){
						name(signer.firstName+" "+signer.lastName+" ("+signer.title+")")
						//Optional id which will be available in onItemSelect
						id(signer.id)
					}
				}
			}
		}
	}
	def tagAJAX(){
		def tags = Tag.createCriteria().list{
			like("label","%"+params.query+"%")
			maxResults(10)
		}

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				tags.each { tag ->
					result(){
						name(tag.label)
						//Optional id which will be available in onItemSelect
						id(tag.id)
					}
				}
			}
		}
	}
	def unitAJAX(){
		def units = Unit.createCriteria().list{
			like("label","%"+params.query+"%")
			maxResults(10)
		}

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				units.each { unit ->
					result(){
						name(unit.label)
						//Optional id which will be available in onItemSelect
						id(unit.id)
					}
				}
			}
		}
	}
	def typeAJAX(){
		def types = Type.createCriteria().list{
			like("label","%"+params.query+"%")
		}

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				types.each {type ->
					result(){
						Type:
						name(type.label)
						//Optional id which will be available in onItemSelect
						id(type.id)
					}
				}
			}
		}
	}
	def orgAJAX(){
		def orgs = Organization.createCriteria().list{
			like("label","%"+params.query+"%")
			maxResults(10)
		}

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				orgs.each {org ->
					result(){
						Type:
						name(org.label)
						//Optional id which will be available in onItemSelect
						id(org.id)
					}
				}
			}
		}
	}
}
