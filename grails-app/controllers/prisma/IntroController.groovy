package prisma

import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.commons.GrailsApplication

@Secured(['permitAll'])
class IntroController {

    def index() {
        redirect(action: "intro")
    }

    def intro() {

        [organizationInstanceList: Organization.list(params), organizationInstanceTotal: Organization.count()]
    }

    def show() {
        def begChar = params.id
        ArrayList<String> sortedOrgazizations = new ArrayList<>()
        Organization.list(params).each {
            if (it.label.startsWith(begChar)) {
                sortedOrgazizations.add(it.label)
            }
        }

        [sortedOrgazizations: sortedOrgazizations]
    }

    def addToList() {
        def chosenOrganization = Organization.findByLabel(params.chosenOrgan)
        def setting = Setting.get(1)
        String responseMsg
        if (!setting.orgs.contains(chosenOrganization)) {
            setting.addToOrgs(chosenOrganization)
            responseMsg = "Organization successfully added to the list"
        } else {
            responseMsg = "The organization is already selected"
        }
        setting.save(flush: true)
        render(text: responseMsg)
    }

    def removeFromList() {
        def chosenOrganizationToRemove = Organization.findByLabel(params.chosenOrganToDelete)
        def setting = Setting.get(1)
        setting.removeFromOrgs(chosenOrganizationToRemove)
        render(view: 'showSelected', model: [orgsFromDatabase: Setting.get(1).orgs])
    }

    def showSelected() {
        [orgsFromDatabase: Setting.get(1).orgs]
    }

    def showTab() {
        params.order = "asc"
        params.sort = "label"
        ArrayList<String> firstChar = new ArrayList<>()
        Organization.list(params).each {
            if (!firstChar.contains(it.label.substring(0, 1))) {
                firstChar.add(it.label.substring(0, 1))
            }
        }
        [firstChar: firstChar]

    }
    def upload(){
        def f = request.getFile('myFile')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'change_img')
            return
        }
        f.transferTo(new File('web-app/images/slider_image_dim_2.jpg'))
        response.sendError(200, 'Done')
    }
    def change_img(){

    }
}