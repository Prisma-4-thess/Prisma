package prisma

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class AndroidController {
    def static maxResults = 100

    def index() {
        def geo1 = new Geo()
        geo1 = Geo.all
        def c = new Decision()
        def lat, lon, namegrk, geoid, co, address
        def marker = []
        int i = 0
        geo1.each { g ->
            geoid = g.id
            lat = g.latitude
            lon = g.longitude
            namegrk = g.namegrk
            address = g.address
            c = Decision.createCriteria().list {
                geo {
                    eq("id", g.id)
                }
            }
            co = c.size()
            if (co > 0) {
                marker.add([latitude: lat, longitude: lon, namegrk: namegrk, id: geoid, counter: co, address: address])
                i++
            }
        }
        def res = [marker: marker]
        render res as JSON
    }

    def all() {
        def geo1 = new Geo()
        geo1 = Geo.all
        def lat, lon, namegrk, geoid
        def marker = new Map[geo1.size()]
        int i = 0
        geo1.each { g ->
            geoid = g.id
            lat = g.latitude
            lon = g.longitude
            namegrk = g.namegrk
            marker[i] = [latitude: lat, longitude: lon, namegrk: namegrk, id: geoid]
            i++
        }
        def res = [marker: marker]
        render res as JSON
    }

    def rgeo() {
        println params.id

        def geoD = new Decision()
        geoD = Decision.createCriteria().list {
            geo {
                eq("id", params.id.toLong())
            }
            maxResults(maxResults)
        }
        def ada, sub, id
        def marker = new Map[geoD.size()]
        int i = 0
        geoD.each { g ->
            id = g.id
            ada = g.ada
            sub = g.subject
            marker[i] = [ada: ada, subject: sub, id: id]
            i++
        }
        def res = [marker: marker]
        render res as JSON
    }

    def show() {
        def geo
        def marker = new Map[1]
        def dec = Decision.get(params.id)
        def dec_ext = new Decision_ext()
        dec_ext = Decision_ext.createCriteria().list {
            decision {
                eq("ada", dec.ada)
            }
        }

        def org = new Organization()
        org = Organization.createCriteria().get {
            units {
                eq("id", dec.unit.id)
            }
        }

        def dec2 = new Decision()
        dec2 = Decision.createCriteria().list {
            decisionToCorrect {
                eq("ada", dec.ada)
            }
        }
        if (dec.geo == null) {
            geo = false
        } else {
            geo = true
        }

        marker[0] = [ada: dec.ada, subject: dec.subject, url: dec.documentUrl, unit: dec.unit.label, org: org.label, geo: geo]
        def res = [marker: marker]
        render res as JSON
    }

    def ada() {
        println params.id
        def ada, sub, id, geo
        int i = 0
        def decision = new Decision()
        def c = Decision.createCriteria()
        decision = c.list {
            like("ada", "%" + params.id + "%")
            maxResults(maxResults)
        }
        def marker = new Map[decision.size()]
        decision.each { g ->
            ada = g.ada
            sub = g.subject
            if (g.geo == null) {
                geo = false
            } else {
                geo = true
            }
            marker[i] = [ada: ada, subject: sub, id: g.id, geo: geo]
            i++
        }
        def res = [marker: marker]
        render res as JSON
    }

    def predef() {
        def dec = new Decision()
        def geo = new Geo()
        dec = Decision.get(params.did)
        geo = Geo.get(params.gid)
        def p = new Predefined()
        p.decision = dec
        p.geo = geo
        def res
        if (p.validate()) {
            p.save(flush: true)
            res = [status: 'success']
        } else {
            res = [status: 'fail']
        }
        render res as JSON
    }

    def userdef() {
        def geoD = new Userdefgeo()
        def dec = new Userdefdec()
        geoD.latitude = params.lat.toDouble()
        geoD.longitude = params.lng.toDouble()
        geoD.namegrk = params.ngrk
        geoD.address = params.adr
        def res
        if (geoD.validate()) {
            geoD.save(flush: true)
            dec.decision = Decision.get(params.did)
            dec.geo = Userdefgeo.get(geoD.id)
            if (dec.validate()) {
                dec.save(flush: true)
                res = [status: 'success']
            } else {
                res = [status: 'fail']
            }
        } else {
            res = [status: 'fail']
        }
        render res as JSON
    }
}
