package prisma

class Signer {
	String firstName
	String lastName
	String title
	String position
	boolean active
	String toString(){
		return "${firstName} ${lastName} (${title})"
	}
	static constraints = {
		firstName(nullable:true)
		lastName(nullable:true)
		position(nullable:true)
		title(nullable:true)
	}
}
