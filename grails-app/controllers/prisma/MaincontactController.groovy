package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class MaincontactController {

    def index() {
        def c = new Contact()
        c.name = params.name
        c.email = params.email
        c.message = params.message
        try {
            (c.save(flush: true, failOnError: true))
            [mes: 'Το μηνυμα εσταλει']
        } catch (Exception e) {
            [mes: 'Αποστολη απετυχε']
        }
    }
}
