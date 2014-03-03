package prisma

class Unit {
	String label
	static belongsTo=[organization:Organization]
	String toString(){
		if(label=='NULL'){
			rerurn '<empty label>'
		}
		return label
	}
	static constraints = {
		label(nullable:true,blank:false)
	}
}
