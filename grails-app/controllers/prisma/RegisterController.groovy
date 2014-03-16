package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class RegisterController {

	def index() {
	}
	def insert(){
		def user=new User()
		def user_role=new UserRole()
		def role=Role.findByAuthority('ROLE_USER')
		def pass_error
		def success
		if(params.password!=params.repassword){
			pass_error=true
		}else{
			user.username=params.username
			user.password=params.password
			user.email=params.mail
			if(user.validate()){
				success=true
				user_role.user=user
				user_role.role=role
				user.save(flush:true)
				user_role.save(flush:true)
			}
		}
		[user:user,pass_error:pass_error,success:success]
	}
}
