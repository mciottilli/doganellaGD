package it.solvingteam.doganellaGD.core

class Fruitore {
	
	String nome
	String cognome
	Date dataNascita
	String codice
	
	

    static constraints = {
		nome (nullable:true)
		cognome (nullable:true)
		dataNascita (nullable:true)
    }



	@Override
	public String toString() {
		return nome +" "+cognome
	}
	
	
	
}
