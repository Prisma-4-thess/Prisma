package prisma

class Geo_temp {
double latitude
double longitude
String namegrk
String address
    static constraints = {
		latitude(nullable:false)
		longitude(nullable:false)
		address(nullable:true)
		namegrk(nullable:true)
    }
}
