package prisma

class Decision_ext {
	String value
	Extra extra
	Decision decision
	static constraints = {
		extra(nullable:true)
		decision(unique:"extra")
	}
}
