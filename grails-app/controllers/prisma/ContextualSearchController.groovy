package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class ContextualSearchController {

    def index() {


    }
    def search(){
        def query = "*" + params.query + "*"

        def signers = Signer.search(query, defaultOperator: "or").results
        println "Signer Suggestions: " + Signer.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

        for (Signer signer : signers) {
            def sign = Signer.findById(signer.getId())
            println "Signer: " + sign
            println "Signer decisions: " + sign.decisions

            println "Signer Similar: " + signer.moreLikeThis(result: 'every')

        }


        def decisions = Decision.search(query, defaultOperator: "or").results
        println "Decision Suggestions: " + Decision.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

        for (Decision decision : decisions) {
            def dec = Decision.findById(decision.getId())
            println "Decision: " + dec
            println "Decision subject: " + dec.subject

            println "Decision Similar: " + decision.moreLikeThis(result: 'every')

        }

        def types = Type.search(query, defaultOperator: "or").results
        println "Type Suggestions: " + Type.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

        for (Type type : types) {
            def t = Type.findById(type.getId())
            println "Type: " + t
            println "Type Decisions: " + t.decisions

            println "Type Similar: " + t.moreLikeThis(result: 'every')

        }

        def geos = Geo.search(query, defaultOperator: "or").results
        println "Geo Suggestions: " + Geo.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

        for (Geo geo : geos) {
            def g = Geo.findById(geo.getId())
            println "Geo: " + g
            println "Geo Decisions: " + g.decisions

            println "Geo Similar: " + geo.moreLikeThis(result: 'every')

        }

        /*def signer = Signer.createCriteria().list {
            like("lastName", "%" + query + "%")

        }

        println signer
        println signer.decisions*/

        [decisions: decisions, signers: signers, types: types, geos: geos]
    }
}
