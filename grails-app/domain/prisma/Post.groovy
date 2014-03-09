package prisma

import java.sql.Timestamp

class Post {
	String firstName
	String lastName
	String text
	Date date
	static belongsTo=[decision:Decision]
    static constraints = {
		text(nullable:false)
    }
	static mapping = {
		text type: 'text'
}
}
