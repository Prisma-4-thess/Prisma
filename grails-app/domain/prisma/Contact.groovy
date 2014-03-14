package prisma

class Contact {
	String name
	String email
	String message

    static constraints = {
		name(nullable:false)
		email(nullable:true,email:true)
    }
	static mapping = {
		message type: 'text'
	 }
}
