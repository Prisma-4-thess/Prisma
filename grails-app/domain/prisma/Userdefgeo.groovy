package prisma

class Userdefgeo {
double latitude
double longitude
String namegrk
String address
String toString(){
	return namegrk
	}
    static constraints = {
		address(nullable:true)
		namegrk(nullable:false,blank:false)
    }
}
