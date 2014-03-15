import prisma.User;
import prisma.Role
import prisma.UserRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = createRole('ROLE_ADMIN')
		def userRole = createRole('ROLE_USER')
		User admin = createUser('admin', adminRole)
    }
		private User createUser(username, role) {
			
				def defaultPassword = 'spydiko2014'
			
				User user = User.findByUsername(username) ?: new User(
						username: username,
						password: defaultPassword,
						enabled: true).save()
			
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
