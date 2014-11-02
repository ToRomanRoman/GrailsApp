package flok

class Boss {

    String login
    String password
    static constraints = {
        login(unique: true)
        password(password: true)
    }
}
