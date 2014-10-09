package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class MainController {

    def index() {
        println('in main '+params.lang)
    }
}
