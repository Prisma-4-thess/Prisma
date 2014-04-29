package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SetupController {

    def index() {
        redirect action: 'script'
    }
    def script(){
        def command='./t'
        def proc=command.execute()
        println 'executing'
        println proc.getText()
        def outStr=proc.getOut()
        inputStr.println()
        proc.waitFor()
    }
}
