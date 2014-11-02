package flok



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BossController {

    def scaffold = true

    def index={
        if (!session.user) {
            redirect(controller: "Boss", action: "login")
            }else{
            params.max=10
            respond Boss.list(params), model: [bossInstanceCount: Boss.count()]
        }
    }

    def login = {}

    def authenticate = {
        def user = Boss.findByLoginAndPassword(params.userName, params.password)

        if (user) {
            session.user = user
            flash.message = "Hello ${user.login}!"
            redirect(controller: "Boss", action: "index")

        } else {
            flash.message = "Sorry, ${params.login}. Please try again."
            redirect(action: "login")
        }
    }

    def logout = {
        flash.message = "Goodbye dear java"
        session.user = null
        redirect(action: "login")
    }
}
