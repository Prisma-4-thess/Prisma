package prisma

class Signer {
    static searchable = {
        lastName boost: 2.0
        firstName boost: 2.0
        title boost: 2.0
        only = ['firstName', 'lastName', 'title', 'position']
        lastName spellCheck: "include"
        firstName spellCheck: "include"
        all termVector: "yes"
    }
//    static searchable = true
    String firstName
    String lastName
    String title
    String position
    static hasMany = [decisions: Decision]
    boolean active

    String toString() {
        return "${firstName} ${lastName} (${title})"
    }
    static constraints = {
        firstName(nullable: true)
        lastName(nullable: true)
        position(nullable: true)
        title(nullable: true)
        decisions(nullable: true)
    }
}
