package prisma

class Geo {
    static searchable = {
        namegrk boost: 2.0
        only = ['address', 'namegrk', 'dimos']
        namegrk spellCheck: "include"
        address spellCheck: "include"
        dimos spellCheck: "include"
        all termVector: "yes"
    }
	double latitude
	double longitude
	String address
	String tk
	String newCat
	String namegrk
	String phone
	String dimos
	String newSubCat
    static hasMany = [decisions:Decision]
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
        decisions(nullable:true)
	}
}
