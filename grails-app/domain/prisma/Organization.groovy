package prisma

class Organization {
	String latinName
	String label
	boolean active
    boolean toShow
	static hasMany = [units: Unit]
	String toString(){
		return label
	}
	static constraints = {
		label(nullable:false,blank:false)
	}
    static mapping = {
        toShow defaultValue: false  //TODO: Check Crawler
    }
}
