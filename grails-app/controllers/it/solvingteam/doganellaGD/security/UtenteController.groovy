package it.solvingteam.doganellaGD.security

class UtenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [utenteInstanceList: Utente.list(params), utenteInstanceTotal: Utente.count()]
    }

    def create = {
        def utenteInstance = new Utente()
        utenteInstance.properties = params
        return [utenteInstance: utenteInstance]
    }

    def save = {
        def utenteInstance = new Utente(params)
		utenteInstance.enabled = true
		def ruoloInstance = Ruolo.get(1)
        if (utenteInstance.save(flush: true)) {
			UtenteRuolo.create utenteInstance, ruoloInstance, true
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'utente.label', default: 'Utente'), utenteInstance.id])}"
            redirect(action: "show", id: utenteInstance.id,params:[max:params.max, offset: params.offset])
        }
        else {
            render(view: "create", model: [utenteInstance: utenteInstance])
        }
    }

    def show = {
        def utenteInstance = Utente.get(params.id)
        if (!utenteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [utenteInstance: utenteInstance,max:params.max,offset:params.offset]
        }
    }

    def edit = {
        def utenteInstance = Utente.get(params.id)
        if (!utenteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [utenteInstance: utenteInstance]
        }
    }

    def update = {
        def utenteInstance = Utente.get(params.id)
        if (utenteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (utenteInstance.version > version) {
                    
                    utenteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'utente.label', default: 'Utente')] as Object[], "Another user has updated this Utente while you were editing")
                    render(view: "edit", model: [utenteInstance: utenteInstance])
                    return
                }
            }
            utenteInstance.properties = params
            if (!utenteInstance.hasErrors() && utenteInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'utente.label', default: 'Utente'), utenteInstance.id])}"
                redirect(action: "show", id: utenteInstance.id, params:[max:params.max, offset: params.offset])
				
            }
            else {
                render(view: "edit", model: [utenteInstance: utenteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def utenteInstance = Utente.get(params.id)
        if (utenteInstance) {
            try {
                utenteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def changePassword = {
		def utenteInstance = Utente.get(params.id)
		if (utenteInstance) {
			[utenteInstance:utenteInstance]
		}else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'utente.label', default: 'Utente'), params.id])}"
            redirect(action: "list",params:[max:params.max, offset: params.offset])
        }
	}
	def updatePassword = {UtenteCommand uc ->
	
		def utenteInstance = Utente.get(params.id as long)
		
		if(uc.validate()){
			utenteInstance.password = uc.nuovaPassword
			if (utenteInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'utente.label', default: 'Utente'), utenteInstance.username])}"
				redirect(action: "list", id: utenteInstance.id)
			}
			else {
				render(view: "changePassword", model: [uc: uc,utenteInstance: utenteInstance])
			}
			
		}else{
			render(view: "changePassword", model:[uc: uc,utenteInstance: utenteInstance])
			return
		}
		
	}
}

class UtenteCommand{
	
	String nuovaPassword
	String confermaPassword
	
	static constraints = {
		
		nuovaPassword (nullable:false)
		nuovaPassword(
			validator: {
				val ->
				if(!val){
					return ['label.nuova.password']
				}
			}
			)
		confermaPassword (nullable:false)
		confermaPassword (
			validator: {
				val,obj ->
				if(!val){
					return ['default.label.errors.mismatch.password']
				}
				if(val!= obj.nuovaPassword){
					return ['default.label.errors.mismatch.password']
				}
				}
			
			)
		
	}
	
}
