package prisma

class Post {
	String firstName
	String lastName
	String text
	static belongsTo=[decision:Decision]
    static constraints = {
		text(nullable:false)
    }
	static mapping = {
		text type: 'text'
}
}
