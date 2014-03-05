package prisma

class Tag {
	String label
	static belongsTo= Decision
	static hasMany=[decisions:Decision]
	String toString(){
		return label
	}
	static constraints = {
		label(nullable:false,blank:false)
	}
}
