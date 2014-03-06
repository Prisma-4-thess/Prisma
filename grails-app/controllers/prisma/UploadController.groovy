package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class UploadController {

	def index() {
		[typ:Type.list(),tag:Tag.list(),un:Unit.list()]
	}
	def error(){
	}
	def upload(){
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'index')
			return
		}
		def dec=new Decision()
		dec.ada=params.ada
		f.transferTo(new File('web-app/pdf/'+params.ada))
		dec.protocolNumber=params.prot
		dec.subject=params.subject
		def (first,last)=params.signer.tokenize(' ')
		dec.type=Type.createCriteria().get{eq("label",params.type)}
		dec.unit=Unit.createCriteria().get{eq("label",params.unit)}
		dec.tags=Tag.createCriteria().list{eq("label",params.tag)}
		dec.signer=Signer.createCriteria().get{
			eq("firstName",first)
			eq("lastName",last)
		}
		//		dec.date=Date.fromString(params.date)
		dec.date = params.date
		dec.documentUrl=params.ada
		dec.url='pdf/'+params.ada
		dec.save(flush: true,failOnError:true)
		render (view:"success", model:[documentUrl:params.ada])

	}
	def signerAJAX(){
		def signers = Signer.createCriteria().list{
			or{
				like("firstName",params.query+"%")
				like("lastName",params.query+"%")
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
