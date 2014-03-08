package prisma

class Geo {
	double latitude
	double longitude
	String address
	String tk
	String newCat
	String namegrk
	String phone
	String dimos
	String newSubCat
	String toString(){
		return namegrk
	}
	static constraints = {
		latitude(nullable:false)
		longitude(nullable:false)
		address(nullable:true)
		tk(nullable:true)
		newCat(nullable:true)
		namegrk(nullable:true)
		phone(nullable:true)
		dimos(nullable:true)
		newSubCat(nullable:true)
	}
}
