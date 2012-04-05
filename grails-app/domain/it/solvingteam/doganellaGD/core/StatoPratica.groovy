package it.solvingteam.doganellaGD.core

class StatoPratica {
	
	static final String PREGRESSA = "Pregressa"
	static final String INGRESSO = "Ingresso"
	static final String USCITA = "Uscita"
	
	String descrizione

    static constraints = {
		
		descrizione(nullable:false)
    }
}
