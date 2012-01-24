package it.solvingteam.doganellaGD.core

import grails.converters.JSON
import it.solvingteam.doganellaGD.documentazione.DocumentObject

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

    def save = {PraticaCommand cmd ->

        def praticaInstance = new Pratica()
        if (cmd.fruitore == null) {
            println '---------------sei qui---------- ' + cmd.fruitore
            flash.message = "Inserire un Fruitore valido"
            redirect(action: "create", params: params)
            return
        }
        praticaInstance.fruitore = cmd.fruitore


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
		log.info "cerca...."
		println ('sei qui....')
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def praticaInstanceList = Pratica.cercaPratiche(cmd, params)
        render(view: "list", model: [praticaInstanceList: praticaInstanceList, praticaInstanceTotal: praticaInstanceList.totalCount])


    }

    def autocompleteSearch = {
        def listaFruitori = []
        def results = Fruitore.withCriteria {
            or {
                ilike 'nome', params.term + '%'
                ilike 'cognome', params.term + '%'
            }
        }.each {r ->
            def mapFruitori = [:]
            mapFruitori.put("id", r.id)
            mapFruitori.put("label", r.nome + " " + r.cognome)
            listaFruitori << mapFruitori

        }


        render listaFruitori as JSON
    }

    def attachDocument = {
        def praticaInstance = Pratica.get(params.id)

        render(view: "attachDocument", model: [praticaInstance: praticaInstance])

    }

    def showDocumento = {
        DocumentObject docObj = DocumentObject.get(params.id)
        println '------------------------------- ' + docObj.docName
        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "attachment;filename=\"" + docObj.docName + "\"")
        response.outputStream << docObj.fileAllegatoByteArray
    }

    def deleteDocumento = {
        DocumentObject docObj = DocumentObject.get(params.id)
        def praticaInstance = Pratica.get(params.idPratica)
        praticaInstance.removeFromAllegati(docObj)
        if (docObj) {
            try {
                docObj.delete(flush: true)
                flash.message = "Documento eliminato con successo"
                redirect(action: "attachDocument", id: praticaInstance.id)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [docObj.docName])}"
                redirect(action: "attachDocument", id: praticaInstance.id)
            }
        }
        else {
            flash.message = "Non � stato possibile eliminare il documento"
            redirect(action: "attachDocument", id: praticaInstance.id)
        }
    }

    def saveDocument = {PraticaCommand cmd ->
        def praticaInstance = Pratica.get(params.id)

        String fileName = request.getFile("allegati").originalFilename
        if (cmd.allegati) {
            //ottengo il nome originale del file caricato dal client
            //salvo il documento
            DocumentObject docObj = new DocumentObject(docName: fileName, dataCreazione: new Date(), fileAllegatoByteArray: cmd.allegati)
            praticaInstance.addToAllegati(docObj)
        }
        if (praticaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.attach.message', args: [fileName])}"
            redirect(action: "show", id: praticaInstance.id)
        } else {
            flash.message = "Non � stato possibile allegare il documento"
            redirect(action: "attachDocument", id: params.id)
        }
    }
}

class PraticaCommand {

    String numeroProtocollo
    Date data
    String descrizione
    String note
    String nomecognome
    byte[] allegati
    Fruitore fruitore

    static constraints = {
        numeroProtocollo(nullable: true)
        data(nullable: true)
        descrizione(nullable: true)
        note(nullable: true)
        nomecognome(nullable: true)
        allegati(nullable: true)
        fruitore(blank: false)
    }

}
