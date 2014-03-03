package prisma

class Tag {
	String label
	String toString(){
		return label
	}
	static constraints = {
		label(nullable:false,blank:false)
	}
}
