class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{ constraints { // apply constraints here
			} }

		name rootUrl: "/"(view:"/index")
		name error: "500"(view:'/error')

		name adminPanel: "/admin_panel"(view:"/admin_panel")
		name modPanel: "/mod_panel"(view:"/mod_panel")
		name upPanel: "/up_panel"(view:"/up_panel")
	}
}
