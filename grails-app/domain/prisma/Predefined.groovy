package prisma

class Predefined {
Decision decision
Geo geo
    static constraints = {
		decision(unique:'geo',nullable:false)
		geo(nullable:false)
    }
}
