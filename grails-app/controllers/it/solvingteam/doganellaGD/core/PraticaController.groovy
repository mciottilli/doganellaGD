package it.solvingteam.doganellaGD.core


class PraticaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [praticaInstanceList: Pratica.list(params), praticaInstanceTotal: Pratica.count()]
    }

    def create = {
        def praticaInstance = new Pratica()
        praticaInstance.properties = params
        return [praticaInstance: praticaInstance]
    }

    def save = {
        def praticaInstance = new Pratica(params)
        if (praticaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pratica.label', default: 'Pratica'), praticaInstance.id])}"
            redirect(action: "show", id: praticaInstance.id)
        }
        else {
            render(view: "create", model: [praticaInstance: praticaInstance])
        }
    }

    def show = {
        def praticaInstance = Pratica.get(params.id)
        if (!praticaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pratica.label', default: 'Pratica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [praticaInstance: praticaInstance]
        }
    }

    def edit = {
        def praticaInstance = Pratica.get(params.id)
        if (!praticaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pratica.label', default: 'Pratica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [praticaInstance: praticaInstance]
        }
    }

    def update = {
        def praticaInstance = Pratica.get(params.id)
        if (praticaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (praticaInstance.version > version) {
                    
                    praticaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pratica.label', default: 'Pratica')] as Object[], "Another user has updated this Pratica while you were editing")
                    render(view: "edit", model: [praticaInstance: praticaInstance])
                    return
                }
            }
            praticaInstance.properties = params
            if (!praticaInstance.hasErrors() && praticaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pratica.label', default: 'Pratica'), praticaInstance.id])}"
                redirect(action: "show", id: praticaInstance.id)
            }
            else {
                render(view: "edit", model: [praticaInstance: praticaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pratica.label', default: 'Pratica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def praticaInstance = Pratica.get(params.id)
        if (praticaInstance) {
            try {
                praticaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pratica.label', default: 'Pratica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pratica.label', default: 'Pratica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pratica.label', default: 'Pratica'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def result = {PraticaCommand cmd ->
		 params.max = Math.min(params.max ? params.int('max') : 10, 100)
		 def praticaInstanceList =  Pratica.cercaPratiche(cmd, params)
		render(view:"list",model:[praticaInstanceList: praticaInstanceList, praticaInstanceTotal: praticaInstanceList.totalCount])
		
		
	}
	
}

class PraticaCommand{
	
	String numeroProtocollo
	Date data
	String descrizione
	String note
	String nomecognome
	
	 static constraints = {
		numeroProtocollo (nullable:true)
		data (nullable:true)
		descrizione (nullable:true)
		note (nullable:true)
		nomecognome (nullable:true)
    }
	
}
