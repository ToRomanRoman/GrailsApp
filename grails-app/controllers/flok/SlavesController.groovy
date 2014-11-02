package flok

import org.apache.commons.io.IOUtils
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SlavesController {
    def beforeInterceptor = [action: this.&auth]



    //Import csv
    @Transactional
    def slaves(Slaves slavesInstance) {
      try{  String theString = IOUtils.toString(params.data.getInputStream(), "UTF-8")
        String[] str = theString.split(",")
        for (int i = 0; i < str.length; i += 3) {
         def create=  new Slaves(name: str[i], email: str[i + 1], adress: str[i + 2]).save()
        }
        println theString
        redirect(controller: "Slaves", action: "index")
      }catch(Exception e) {
          print 'do not manage to add'
            redirect(controller: "Slaves", action: "index")
        }

    }

    def auth() {
        if (!session.user) {
            redirect(controller: "Boss", action: "login")
            return false
        }

    }

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Slaves.list(params), model: [slavesInstanceCount: Slaves.count()]
    }

    def show(Slaves slavesInstance) {
        respond slavesInstance
    }

    def create() {
        respond new Slaves(params)
    }

    @Transactional
    def save(Slaves slavesInstance) {
        if (slavesInstance == null) {
            notFound()
            return
        }

        if (slavesInstance.hasErrors()) {
            respond slavesInstance.errors, view: 'create'
            return
        }

        slavesInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'slaves.label', default: 'Slaves'), slavesInstance.id])
                redirect slavesInstance
            }
            '*' { respond slavesInstance, [status: CREATED] }
        }
    }

    def edit(Slaves slavesInstance) {
        respond slavesInstance
    }

    @Transactional
    def update(Slaves slavesInstance) {
        if (slavesInstance == null) {
            notFound()
            return
        }

        if (slavesInstance.hasErrors()) {
            respond slavesInstance.errors, view: 'edit'
            return
        }

        slavesInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Slaves.label', default: 'Slaves'), slavesInstance.id])
                redirect slavesInstance
            }
            '*' { respond slavesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Slaves slavesInstance) {

        if (slavesInstance == null) {
            notFound()
            return
        }

        slavesInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Slaves.label', default: 'Slaves'), slavesInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'slaves.label', default: 'Slaves'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
