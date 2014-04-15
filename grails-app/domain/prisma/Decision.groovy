package prisma

class Decision {
	String ada
	String protocolNumber
	String subject
	String url
	String documentUrl
	Date date
	Decision decisionToCorrect
    static belongsTo = [signer:Signer,type:Type,unit:Unit,geo:Geo]
	static hasMany=[tags:Tag]
	String toString(){
		return ada
	}
	static constraints = {
		ada(nullable:false,blank:false,unique:true)
		decisionToCorrect(nullable:true)
		geo(nullable:true)

	}
	static mapping = {
		subject type: 'text'
		signer lazy: false
		tags lazy: false
		unit lazy: false
		date lazy: false
	}
}
