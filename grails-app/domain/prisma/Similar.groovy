package prisma

class Similar {
	Decision decision
	Decision sim_decision
    static constraints = {
		decision(unique:'sim_decision')
    }
}
