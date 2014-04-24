package prisma

class Decision {
    static searchable = {
        subject boost: 2.0
        only = ['ada', 'subject', 'protocolNumber']
        ada spellCheck: "include"
        all termVector: "yes"
    }
//    static searchable = true;
    String ada
    String protocolNumber
    String subject
    String url
    String documentUrl
    Date date
    Decision decisionToCorrect
    static belongsTo = [signer: Signer, type: Type, unit: Unit, geo: Geo]
    static hasMany = [tags: Tag, simDecisions: Decision]

    String toString() {
        return ada
    }
    static constraints = {
        ada(nullable: false, blank: false, unique: true)
        decisionToCorrect(nullable: true)
        geo(nullable: true)

    }
    static mapping = {
        subject type: 'text'

        //Lazy loading turned off in order to show them.
        signer lazy: false
        tags lazy: false
        unit lazy: false
        date lazy: false
    }
}
