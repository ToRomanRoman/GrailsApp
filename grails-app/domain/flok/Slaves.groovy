package flok

class Slaves {

    String name
    String email
    String adress

    static constraints = {
        name(blank: false)
        email(email: true)
        adress(blank: false)
    }
}
