package it.solvingteam.doganellaGD.util

import it.solvingteam.doganellaGD.core.Pratica;
import it.solvingteam.doganellaGD.core.StatoPratica;


class MyUtility {

	static final String DOG = "DOG"
	
	def static  calcolaNumeroProtocollo(int id,Pratica pratica) {
		def numeroProtocollo = MyUtility.DOG
		
		if(pratica.stato == StatoPratica.INGRESSO){
			
			numeroProtocollo
		}
		
		
		numeroProtocollo
		
		
	}
	
	static String getYearFormDate(Date data) {
		data.year + 1900
	}
	
	
}
