package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class ContextualSearchController {

    def index() {
    }

    def search() {

        try {
            if (params.query.equals(message(code: 'homepage.searchHint'))) render(text: '<p>' + message(code: 'homepage.emptySearchMessage') + '<p>')
            def query = "*" + params.query + "*"

            ArrayList<Decision> decisions = new ArrayList<>()
            def resultsDecisions = Decision.search(query, defaultOperator: "or").results
            println "Decision Suggestions: " + Decision.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

            for (Decision decision : resultsDecisions) {
                def dec = Decision.findById(decision.getId())
                println "Decision: " + dec
                println "Decision subject: " + dec.subject

                println "Decision Similar: " + decision.moreLikeThis(result: 'every')

                decisions.add(dec)

            }

            ArrayList<Signer> signers = new ArrayList<>()
            def resultsSigners = Signer.search(query, defaultOperator: "or").results
            println "Signer Suggestions: " + Signer.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

            for (Signer signer : resultsSigners) {
                def sign = Signer.findById(signer.getId())
                println "Signer: " + sign
                //            println "Signer decisions: " + sign.decisions

                println "Signer Similar: " + signer.moreLikeThis(result: 'every')
                signers.add(sign)

            }

            ArrayList<Type> types = new ArrayList<>()
            def resultsTypes = Type.search(query, defaultOperator: "or").results
            println "Type Suggestions: " + Type.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

            for (Type type : resultsTypes) {
                def t = Type.findById(type.getId())
                println "Type: " + t
                //            println "Type Decisions: " + t.decisions

                println "Type Similar: " + t.moreLikeThis(result: 'every')
                types.add(t)

            }

            ArrayList<Geo> geos = new ArrayList<>()
            def resultsGeos = Geo.search(query, defaultOperator: "or").results
            println "Geo Suggestions: " + Geo.suggestQuery(query, escape: true, userFriendly: true, emulateCapitalisation: false, allowSame: true)

            for (Geo geo : resultsGeos) {
                def g = Geo.findById(geo.getId())
                println "Geo: " + g
                //            println "Geo Decisions: " + g.decisions

                println "Geo Similar: " + geo.moreLikeThis(result: 'every')
                geos.add(g)

            }

            [decisions: decisions, decisionInstanceTotal: decisions.size(), source: "home", signers: signers, signerInstanceTotal: signers.size(), types: types, typeInstanceTotal: types.size(), geos: geos]
        } catch (Exception e) {
            render(text: '<p>' + message(code: 'homepage.errorSearchMessage') + '<p>')
        }
    }
}
