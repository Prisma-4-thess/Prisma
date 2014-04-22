package prisma

class Tag {
    /*static searchable = {
        only:['label']
    }*/
	String label
	static belongsTo= Decision
	static hasMany=[decisions:Decision]
	String toString(){
		return label
	}
	static constraints = {
		label(nullable:false,blank:false)
        decisions(nullable:true)
	}
}
