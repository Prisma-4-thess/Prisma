package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class MapController {
//    static scope = "session"
    List<Decision> decision
    def offset = "0"
    def static maxToShow = 10

    def index() {
        def decisionG = new Decision()
        decisionG = Decision.createCriteria().list { isNotNull("geo") }
        println 'size' + decisionG.size()
        def lat, lon, dr, serverURL, geoID, geoName
        def marker = []
        def tempMarker
        decisionG.each { dec ->
            lat = dec.geo.latitude
            lon = dec.geo.longitude
            dr = false
            serverURL = grailsApplication.config.grails.serverURL
            geoID = dec.geo.id
            geoName = dec.geo
            tempMarker = [latitude: lat, longitude: lon, draggable: dr, serverURL: serverURL, geoID: geoID, geoName: geoName]
            if (!marker.contains(tempMarker)) {
                //println "new marker: "+tempMarker
                marker.add([latitude: lat, longitude: lon, draggable: dr, serverURL: serverURL, geoID: geoID, geoName: geoName])
            }
        }

        /*lat=40.636
         lon=22.938
         dr=false
         marker[0] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
         lat=40.65
         lon=22.92
         dr=false
         ds='πλατεία τζομπανογλου'
         marker[1] = [latitude:lat, longitude:lon, draggable:dr,description:ds]*/
        [mark: marker]
    }

    def homepage() {
        println("in homepage "+params.lang)
        def decisionG = new Decision()
        decisionG = Decision.createCriteria().list { isNotNull("geo") }
        println 'size ' + decisionG.size()
        def lat, lon, dr, serverURL, geoID, geoName
        def marker = []
        def tempMarker
        decisionG.each { dec ->
            lat = dec.geo.latitude
            lon = dec.geo.longitude
            dr = false
            serverURL = grailsApplication.config.grails.serverURL
            geoID = dec.geo.id
            geoName = dec.geo
            tempMarker = [latitude: lat, longitude: lon, draggable: dr, serverURL: serverURL, geoID: geoID, geoName: geoName]
            if (!marker.contains(tempMarker)) {
                //println "new marker: "+tempMarker
                marker.add([latitude: lat, longitude: lon, draggable: dr, serverURL: serverURL, geoID: geoID, geoName: geoName])
            }
        }
        [mark: marker]
    }

    def show_geo() {
        //def decisions=new Decision()
        decision = Decision.createCriteria().list {
            geo {
                eq("id", params.id.toLong())
            }
            order("date", "desc")
        }
        def toShow = Math.min(maxToShow, decision.size())

        def timeStamp = new Date();
        println timeStamp;
        session.setAttribute((String) timeStamp, (Object) decision)

        render(view: "/map/markerList", model: [results: decision.subList(0, toShow), decisionInstanceTotal: decision.size(), timeStamp: timeStamp])
    }

    def list() {
        decision = session.getAttribute(params.timeStamp)
//        offset = params.offset
        def toShow = Math.min(Math.abs(decision.size() - params.offset.toInteger()), maxToShow)
        println "toShow: " + toShow
        println "remaining: " + (decision.size())
        render(template: "/common/decision_list", model: [results: decision.subList(params.offset.toInteger(), params.offset.toInteger() + toShow), decisionInstanceTotal: (decision.size()), timeStamp: params.timeStamp])
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

        if (!params.offset.isInteger() ) offset = "0";
        else offset = params.offset
//        try{
//            offset = params.offset
//        }catch (Exception e){
//            offset = "0"
//        }
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
}
