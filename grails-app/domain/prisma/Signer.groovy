package prisma

class Signer {
    static searchable = {
        only: ['firstName', 'lastName', 'title']
        lastName spellCheck : "include"
    }
//    static searchable = true
	String firstName
	String lastName
	String title
	String position
    static hasMany = [decisions:Decision]
	boolean active
	String toString(){
		return "${firstName} ${lastName} (${title})"
	}
	static constraints = {
		firstName(nullable:true)
		lastName(nullable:true)
		position(nullable:true)
		title(nullable:true)
        decisions(nullable:true)
	}
}
