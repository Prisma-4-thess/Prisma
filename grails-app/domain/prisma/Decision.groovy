package prisma

class Decision {
	String ada
	String protocolNumber
	String subject
	String url
	String documentUrl
	Date date
	Signer signer
	Type type
	Decision decisionToCorrect
	static hasMany=[tags:Tag,posts:Post]
	Unit unit
	Geo geo
	String toString(){
		return ada
	}
	static constraints = {
		ada(nullable:false,blank:false,unique:true)
		decisionToCorrect(nullable:true)
		geo(nullable:true)
		posts(nullable:true)
	}
	static mapping = {
		subject type: 'text'
		//signer lazy: false
		tags lazy: false
		/*unit lazy: false
		date lazy: false
		protocolNumber lazy: false
		ada lazy: false*/
	}
}
