package prisma

class Userdefgeo {
double latitude
double longitude
String namegrk
String address
    static constraints = {
		address(nullable:true)
    }
}
