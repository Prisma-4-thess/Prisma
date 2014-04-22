package prisma

class Userdefdec {
Decision decision
Userdefgeo geo
    static constraints = {
		decision(nullable:false)
		geo(nullable:false)
    }
}
