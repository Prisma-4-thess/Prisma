package prisma

class Tag {
String label
    static constraints = {
   label(nullable:false,blank:false)
		 }
}
