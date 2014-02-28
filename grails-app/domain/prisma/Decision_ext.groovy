package prisma

class Decision_ext {
	String value
	Extra extra
	def decision
	static belongsTo=[decision:Decision]
	static constraints = {
		extra(nullable:true)
	}
}
