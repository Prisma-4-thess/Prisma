class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?/$lang?" {}
        name rootUrl: "/"(controller: 'main', action: 'index', lang: 'gr')
//        name maptrick: "/map-hub/$lang" {
//            controller = 'map'
//            action = 'homepage'
//        }
//        name map_en:"/map/homepage"(controller: 'map', action: 'homepage',lang:'en')
//        name sec:"/map/homepage?lang=gr"(view: '/gr/map/homepage')
        name adminPanel: "/admin_panel"(view: "/admin_panel")
        name modPanel: "/mod_panel"(view: "/mod_panel")
        name upPanel: "/up_panel"(view: "/up_panel")
    }
}
