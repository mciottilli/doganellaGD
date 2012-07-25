package it.solvingteam.doganellaGD.core

import it.solvingteam.doganellaGD.documentazione.DocumentObject
import it.solvingteam.doganellaGD.util.MyUtility;

class Pratica {

    String numeroProtocollo
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
		dataAcquisizione(nullable: false)
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
						ilike 'codice', "%${cmd.nomecognome}"
                    }

                }

            }

			if(cmd.stato){
				eq 'stato' , cmd.stato
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
						ilike 'codice', "%${cmd.nomecognome}"
					}

				}

			}
			if(cmd.stato){
				eq 'stato' , cmd.stato
			}
			eq 'contenzioso' , true

		}
	}
	
	public static int maxNumProtocolloPerAnno(String anno){
		def annoInt = Integer.parseInt(anno);
		def c = Calendar.getInstance()
		c.set(annoInt, Calendar.JANUARY, 1)
		def inizioAnno = c.time
		c.add(Calendar.YEAR, 1)
		def fineAnno = c.time - 1
		def results = Pratica.createCriteria().list(){
		between 'dataAcquisizione', inizioAnno, fineAnno
		createAlias("stato","st")
		or{
				eq 'st.descrizione' ,StatoPratica.INGRESSO
				eq 'st.descrizione' ,StatoPratica.USCITA
			}
		isNotNull 'numeroProtocollo'
		}
		MyUtility.getNumeroMaxProtocollo(results)	
	}
	
			
	
}
