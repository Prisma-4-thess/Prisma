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
static hasMany=[tags:Tag,decision_exts:Decision_ext]
Unit unit
String toString(){
	return ada
	}
    static constraints = {
		ada(nullable:false,blank:false,unique:true)
    }
}
