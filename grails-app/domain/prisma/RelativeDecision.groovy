package prisma

class RelativeDecision {
Decision finalDec
Decision relatedDec
    static constraints = {
		finalDec(unique:'relatedDec')
    }
}
