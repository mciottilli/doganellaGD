package it.solvingteam.doganellaGD.core

class FruitoreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fruitoreInstanceList: Fruitore.list(params), fruitoreInstanceTotal: Fruitore.count()]
    }

    def create = {
        def fruitoreInstance = new Fruitore()
        fruitoreInstance.properties = params
        return [fruitoreInstance: fruitoreInstance]
    }

    def save = {
        def fruitoreInstance = new Fruitore(params)
        if (fruitoreInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), fruitoreInstance.id])}"
            redirect(action: "show", id: fruitoreInstance.id)
        }
        else {
            render(view: "create", model: [fruitoreInstance: fruitoreInstance])
        }
    }

    def show = {
        def fruitoreInstance = Fruitore.get(params.id)
        if (!fruitoreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fruitoreInstance: fruitoreInstance]
        }
    }

    def edit = {
        def fruitoreInstance = Fruitore.get(params.id)
        if (!fruitoreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [fruitoreInstance: fruitoreInstance]
        }
    }

    def update = {
        def fruitoreInstance = Fruitore.get(params.id)
        if (fruitoreInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (fruitoreInstance.version > version) {
                    
                    fruitoreInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fruitore.label', default: 'Fruitore')] as Object[], "Another user has updated this Fruitore while you were editing")
                    render(view: "edit", model: [fruitoreInstance: fruitoreInstance])
                    return
                }
            }
            fruitoreInstance.properties = params
            if (!fruitoreInstance.hasErrors() && fruitoreInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), fruitoreInstance.id])}"
                redirect(action: "show", id: fruitoreInstance.id)
            }
            else {
                render(view: "edit", model: [fruitoreInstance: fruitoreInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def fruitoreInstance = Fruitore.get(params.id)
        if (fruitoreInstance) {
            try {
                fruitoreInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fruitore.label', default: 'Fruitore'), params.id])}"
            redirect(action: "list")
        }
    }
}
