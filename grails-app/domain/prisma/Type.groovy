package prisma

class Type {
	String label
	static hasMany = [extras: Extra]
	String toString(){
		return label
	}
	static constraints = {
		label(nullable:false,blank:false)
		extras(nullable:true)
	}
}
