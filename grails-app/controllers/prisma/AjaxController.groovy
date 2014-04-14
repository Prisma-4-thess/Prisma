package prisma

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class AjaxController {
    static scope = "session"
    def organ = new Organization()
    def uni = new Unit()

    def index() {
    }

    def signerAJAX() {
        def signers = new Signer()
        if (params.query.contains(" ")) {
            def (query1, query2) = params.query.tokenize()
            signers = Signer.createCriteria().list {
                or {
                    like("firstName", query1 + "%")
                    like("lastName", query2 + "%")
                    like("firstName", query2 + "%")
                    like("lastName", query1 + "%")
                }
                maxResults(10)
            }
        } else {
            signers = Signer.createCriteria().list {
                or {
                    like("firstName", params.query + "%")
                    like("lastName", params.query + "%")
                }
                maxResults(10)
            }
        }

        //Create XML response
        render(contentType: "text/xml") {
            results() {
                signers.each { signer ->
                    result() {
                        name(signer.firstName + " " + signer.lastName + " (" + signer.title + ")")
                        //Optional id which will be available in onItemSelect
                        id(signer.id)
                    }
                }
            }
        }
    }

    def tagAJAX() {
        def tags = Tag.createCriteria().list {
            like("label", "%" + params.query + "%")
            maxResults(10)
        }

        //Create XML response
        render(contentType: "text/xml") {
            results() {
                tags.each { tag ->
                    result() {
                        name(tag.label)
                        //Optional id which will be available in onItemSelect
                        id(tag.id)
                    }
                }
            }
        }
    }

    def geoAJAX() {
        def geos = Geo.createCriteria().list {
            like("namegrk", "%" + params.query + "%")
            maxResults(10)
        }

        //Create XML response
        render(contentType: "text/xml") {
            results() {
                geos.each { geo ->
                    result() {
                        name(geo.namegrk)
                        //Optional id which will be available in onItemSelect
                        id(geo.id)
                    }
                }
            }
        }
    }

    def unitAJAX() {
        println 'test' + organ
        def units = new Unit();
        if (organ != null) {
            println 'not'
            units = Unit.createCriteria().list {
                and {
                    like("label", "%" + params.query + "%")
                    eq("organization", organ)
                }
                maxResults(10)
            }
        } else {
            println 'in'
            units = Unit.createCriteria().list {
                like("label", "%" + params.query + "%")
                organization {
                    'in'("label", ["Δήμος Θεσσαλονίκης", "Αποκεντρωμένη Διοίκηση Μακεδονίας – Θράκης"])
                }
                maxResults(10)
            }
        }

        //Create XML response
        render(contentType: "text/xml") {
            results() {
                units.each { unit ->
                    result() {
                        name(unit.label)
                        //Optional id which will be available in onItemSelect
                        id(unit.id)
                    }
                }
            }
        }
    }

    def typeAJAX() {
        def types = Type.createCriteria().list {
            like("label", "%" + params.query + "%")
        }

        //Create XML response
        render(contentType: "text/xml") {
            results() {
                types.each { type ->
                    result() {
                        Type:
                        name(type.label)
                        //Optional id which will be available in onItemSelect
                        id(type.id)
                    }
                }
            }
        }
    }

    def selOrg() {
        organ = Organization.findByLabel(params.id)
//		organ=Organization.get(params.id)
        println 'test2mylo:' + params.id

    }

    def selUn() {
        uni = Unit.get(params.id)
    }

    def clearGlobal() {
        organ = null
        uni = null
    }
}
