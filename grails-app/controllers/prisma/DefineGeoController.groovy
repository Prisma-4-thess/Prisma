package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
class DefineGeoController {

    def index() { }
}
