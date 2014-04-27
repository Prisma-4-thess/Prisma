package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class SearchController {
//    static scope = "session"    //TODO: New philosophy of search due to multiple tab problems.
    List<Decision> decision
    def offset = "0"
    def static maxToShow = 10
    def static maxResults = 500

    def index() {
    }

    def ada() {
    }

    def specific() {
    }

    def general() {
    }

    def full_search() {
    }

    def dedicatedSearchPage(){

    }

    def searchada() {

//        decision = new Decision()
        offset = "0"
        def c = Decision.createCriteria()
        decision = c.list {
            like("ada", "%" + params.ada + "%")
            order("date", "desc")
            maxResults(maxResults)
        }
        def toShow = Math.min(maxToShow, decision.size())
        println "toShow: " + toShow


        [results: decision.subList(0, toShow), decisionInstanceTotal: decision.size()]
    }

    def searchgeneral(Integer max) {

        /*println "subject: "+params.subject
         println "type: "+params.type
         println "tag: "+params.tag
         println "fromDate: "+params.fromDate
         println "toDate: "+params.toDate*/

//        decision = new Decision()
        offset = "0"
        def c = Decision.createCriteria()

        decision = c.list {

            like("subject", "%" + params.subject + "%")
            type {
                like("label", "%" + params.type + "%")
            }
            if (!params.tag.empty) {
                tags {
                    like("label", "%" + params.tag + "%")
                }
            }
            if (params.toDate != null) {
                le("date", params.toDate)
            }
            if (params.fromDate != null) {
                ge("date", params.fromDate)
            }
            order("date", "desc")
            maxResults(maxResults)
        }
        def toShow = Math.min(maxToShow, decision.size())
        println "toShow: " + toShow

        [results: decision.subList(0, toShow), decisionInstanceTotal: decision.size()]
        //					[results:decision, decisionInstanceTotal:decision.size()]

    }

    def searchspecific() {

        /*println params.prot_num
         println params.unit
         println params.signer_first
         println params.signer_last
         println params.fromDate
         println params.toDate*/

//        decision = new Decision()
        offset = "0"
        def (first, last) = params.signer.tokenize(' ')

        def c = Decision.createCriteria()

        decision = c.list {
            if (!params.prot_num.empty) {
                like("protocolNumber", "%" + params.prot_num + "%")
            }
            unit {
                like("label", "%" + params.unit + "%")
            }
            unit {
                organization {
                    if (params.org != "null" && !params.org.empty) {
                        println params.org
                        like("label", params.org)
                    } else {
                        println "no org selected"
                        eq("toShow", true)
                    }
                }
            }
            signer {
                if (!params.signer.empty) like("firstName", "%" + first + "%")
                if (!params.signer.empty) like("lastName", "%" + last + "%")
            }
            if (params.toDate != null) {
                le("date", params.toDate)
            }
            if (params.fromDate != null) {
                ge("date", params.fromDate)
            }
            order("date", "desc")
            maxResults(maxResults)
        }

        def toShow = Math.min(maxToShow, decision.size())
        println "toShow: " + toShow

        [results: decision.subList(0, toShow), decisionInstanceTotal: decision.size()]
    }

    def searchfull() {

        println 'test' + params.org
        //		println "numberOfResults: "+params.numberOfResults
//        decision = new Decision()
        offset = "0"
        def (first, last) = params.signer.tokenize(' ')
        def c = Decision.createCriteria()

        decision = c.list {

            like("ada", "%" + params.ada + "%")
            like("subject", "%" + params.subject.replaceAll(" ", "%") + "%")
            type {
                like("label", "%" + params.type + "%")
            }
            if (!params.tag.empty) {
                tags {
                    like("label", "%" + params.tag + "%")
                }
            }
            if (params.toDate != null) {
                le("date", params.toDate)
            }
            if (params.fromDate != null) {
                ge("date", params.fromDate)
            }
            if (!params.prot_num.empty) {
                like("protocolNumber", "%" + params.prot_num + "%")
            }
            unit {
                like("label", "%" + params.unit + "%")
            }
            unit {
                organization {
                    if (params.org != "null" && !params.org.empty) {
                        println params.org
                        eq("label", params.org)
                    } else {
                        println "no org selected"
                        eq("toShow", true)
                    }
                }
            }
            signer {
                if (!params.signer.empty) like("firstName", "%" + first + "%")
                if (!params.signer.empty) like("lastName", "%" + last + "%")
            }
            order("date", "desc")
            maxResults(maxResults)
        }
        def toShow = Math.min(maxToShow, decision.size())

        println "toShow: " + toShow
//        flash.message = decision
        def timeStamp = new Date();
        println timeStamp;
        session.setAttribute((String) timeStamp, (Object) decision)

        [results: decision.subList(0, toShow), decisionInstanceTotal: decision.size(), timeStamp: timeStamp]
    }

    def showDecision() {
        def dec = Decision.get(params.id)
        def dec_ext = new Decision_ext()
        dec_ext = Decision_ext.createCriteria().list {
            decision {
                eq("ada", dec.ada)
            }
        }

        def org = new Organization()
        org = dec.unit.organization
        /*org = Organization.createCriteria().get {
            units {
                eq("id", dec.unit.id)
            }
        }*/

        def dec2 = new Decision()
        dec2 = Decision.createCriteria().list {
            decisionToCorrect {
                eq("ada", dec.ada)
            }
        }

        def relativeDecisions = new RelativeDecision()
        relativeDecisions = RelativeDecision.createCriteria().list { eq("finalDec", dec) }
        //println "relative decisions: "+relativeDecisions.relatedDec
        def simDec = new Decision()
        simDec = Decision.createCriteria().list {
            tags {
                'in'("label", dec.tags.label)
            }
            maxResults(maxToShow)
        }
        //TODO: New tab problem
        if ("true".equals(params.newTab)) {
            render(view: "/search/showInTab", model: [decision: dec, ext: dec_ext, org: org, dec2: dec2, relDec: relativeDecisions.relatedDec, simDec: simDec])
        } else {
            render(template: "/search/showDecision", model: [decision: dec, ext: dec_ext, org: org, dec2: dec2, relDec: relativeDecisions.relatedDec, simDec: simDec])
        }
    }

    def showRelated() {

        def dec = Decision.get(params.decisionId)
        def relativeDecisions = new RelativeDecision()
        relativeDecisions = RelativeDecision.createCriteria().list { eq("finalDec", dec) }
        println "decision: " + dec + " related: " + relativeDecisions.relatedDec
        [dec: dec, relDec: relativeDecisions.relatedDec]
    }

    def showSimilar() {
        def dec = Decision.get(params.decisionId)
        def simDec = new Decision()
        simDec = Decision.createCriteria().list {
            tags {
                'in'("label", dec.tags.label)
            }
            maxResults(maxToShow)
        }
        [dec: dec, simDec: simDec]
    }

    def list() {
//        decision = flash.message
//        flash.message = decision

        def timeStamp = params.timeStamp
        println timeStamp
        decision = session.getAttribute(params.timeStamp)
//        offset = params.offset
        def toShow = Math.min(Math.abs(decision.size() - params.offset.toInteger()), maxToShow)
        println "toShow: " + toShow
        println "remaining: " + (decision.size())
        render(template: "/common/decision_list", model: [results: decision.subList(params.offset.toInteger(), params.offset.toInteger() + toShow), decisionInstanceTotal: (decision.size()), timeStamp: timeStamp])
    }

    def sort() {

        /*def c = Decision.createCriteria()
         decision = c.list {
         eq("ada",decision.ada)
         order(params.sort,params.order)
         }*/

        //		decision = decision.ada.sort{it.size()}
        //		def sortedDecisions = Decision.list(params)
        decision = session.getAttribute(params.timeStamp)
        if (!params.offset.isInteger()) offset = "0";
        else offset = params.offset
        def c = Decision.createCriteria()
        decision = c.list {
            'in'("ada", decision.ada)
            order(params.sort, params.order)
        }

        session.setAttribute(params.timeStamp, decision)

        def toShow = Math.min(Math.abs(decision.size() - offset.toInteger()), maxToShow)
        println offset + ":" + toShow
        render(template: "/common/table_decisions", model: [results: decision.subList(offset.toInteger(), offset.toInteger() + toShow), decisionInstanceTotal: (decision.size()), offset: offset, timeStamp: params.timeStamp])
    }
    def showSigner(){
        def s = Signer.get(params.id)
        render(template: "/search/showSigner", model: [signer:s , signerDecisions: Decision.countBySigner(s)])
    }
    def showType(){
        def t  = Type.get(params.id)

        render(template: "/search/showType", model: [type:t, extraTypes:t.extras, typeDecisions:Decision.countByType(t)])
    }

    def showGeo() {
        def g = Geo.get(params.id)
        render(template: "/search/showGeo", model: [geo:g, geoDecisions:Decision.countByGeo(g)])
    }

}

