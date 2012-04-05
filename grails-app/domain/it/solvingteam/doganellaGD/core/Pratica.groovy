package it.solvingteam.doganellaGD.core

import it.solvingteam.doganellaGD.documentazione.DocumentObject

class Pratica {

    String numeroProtocollo
    Date data
	Date dataAcquisizione
	Date dataAccettazione
    String descrizione
    String note
	boolean contenzioso
	String numeroPosizione
	StatoPratica stato

    static hasMany = [allegati: DocumentObject]

    Fruitore fruitore

    static constraints = {
        numeroProtocollo(nullable: true,unique:true)
        data(nullable: true)
		dataAcquisizione(nullable: true)
		dataAccettazione(nullable: true)
        descrizione(nullable: true)
        note(nullable: true)
        allegati(nullable: true)
        fruitore(nullable: true)
		numeroPosizione(nullable:true)
		stato(nullable:true)
    }

    def static cercaPratiche(cmd, params) {
        def c = Pratica.createCriteria()

        def results = c.list(params) {


            if (cmd.numeroProtocollo) {
                ilike 'numeroProtocollo', "%${cmd.numeroProtocollo}%"
            }
            if (cmd.descrizione) {
                ilike 'descrizione', "%${cmd.descrizione}%"
            }
            if (cmd.dataAcquisizione) {
                eq 'dataAcquisizione', cmd.dataAcquisizione
            }
			if (cmd.dataAccettazione) {
				eq 'dataAccettazione', cmd.dataAccettazione
			}
			if (cmd.numeroPosizione) {
				ilike 'numeroPosizione', "%${cmd.numeroPosizione}%"
			}
            if (cmd.nomecognome) {
                fruitore {
                    or {
                        ilike 'nome', "%${cmd.nomecognome}"
                        ilike 'cognome', "%${cmd.nomecognome}"
                    }

                }


            }

        }
    }
	
	def static cercaPraticheContenzioso(cmd, params) {
		def c = Pratica.createCriteria()

		def results = c.list(params) {
			if (cmd.numeroProtocollo) {
				ilike 'numeroProtocollo', "%${cmd.numeroProtocollo}%"
			}
			if (cmd.descrizione) {
				ilike 'descrizione', "%${cmd.descrizione}%"
			}
			 if (cmd.dataAcquisizione) {
                eq 'dataAcquisizione', cmd.dataAcquisizione
            }
			if (cmd.dataAccettazione) {
				eq 'dataAccettazione', cmd.dataAccettazione
			}
			if (cmd.numeroPosizione) {
				ilike 'numeroPosizione', "%${cmd.numeroPosizione}%"
			}
			if (cmd.nomecognome) {
				fruitore {
					or {
						ilike 'nome', "%${cmd.nomecognome}"
						ilike 'cognome', "%${cmd.nomecognome}"
					}

				}


			}
			eq 'contenzioso' , true

		}
	}
	
	
	
	
}
