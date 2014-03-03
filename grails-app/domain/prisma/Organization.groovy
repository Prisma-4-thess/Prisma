package prisma

class Organization {
	String latinName
	String label
	boolean active
	static hasMany = [units: Unit]
	String toString(){
		return label
	}
	static constraints = {
		label(nullable:false,blank:false)
	}
}
