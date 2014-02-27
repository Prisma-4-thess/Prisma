package prisma

class Geo {
double latitude
double longitude
String label
String toString(){
	return label
	}
    static constraints = {
	latitude(unique:"longitude")
	label(nullable:false,blank:false)
    }
}
