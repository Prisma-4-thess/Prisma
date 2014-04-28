package prisma

class Setting {
    static hasMany = [orgs:Organization]
    String period
    static constraints = {
        orgs(nullable: true)
        period(nullable: true)
    }
//    static mapping = {
//        period defaultValue: 'week'
//    }
}
