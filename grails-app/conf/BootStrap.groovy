import prisma.Setting
import prisma.User;
import prisma.Role
import prisma.UserRole

class BootStrap {

	def init = { servletContext ->
        TimeZone.setDefault(TimeZone.getTimeZone("CET"))
        Locale.setDefault(new Locale("gr"));

		def adminRole = createRole('ROLE_ADMIN')
		def userRole = createRole('ROLE_USER')
		def modRole = createRole('ROLE_MODERATOR')
		def upRole = createRole('ROLE_UPLOADER')
		User admin = createUser('admin', adminRole)
		User mod = createUser('moderator', modRole)
		User up = createUser('uploader', upRole)
        def settings=new Setting()
        settings.save(flush: true)
	}
	private User createUser(username, role) {

		def defaultPassword = 'spydiko2014'

		User user = User.findByUsername(username) ?: new User(
				username: username,
				password: defaultPassword,
				enabled: true,email:'spydiko.dev@gmail.com').save(flush:true)

		if (!user.authorities.contains(role)) {
			UserRole.create (user, role)
		}
		user
	}

	private createRole(String roleName) {
		Role.findByAuthority(roleName) ?: new Role(authority: roleName).save()
	}
	def destroy = {
	}
}
