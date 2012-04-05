package it.solvingteam.doganellaGD.util

import it.solvingteam.doganellaGD.core.Pratica;
import it.solvingteam.doganellaGD.core.StatoPratica;


class MyUtility {

	static final String DOG = "DOG"
	
	def static  calcolaNumeroProtocollo(int num,Pratica pratica) {
		def numeroProtocollo = MyUtility.DOG
		def numStr = String.format('%07d', num?num+1:1)
		numeroProtocollo = numeroProtocollo+getYearFormDate(pratica.dataAcquisizione)+pratica.stato.descrizione.charAt(0)+numStr
		
		numeroProtocollo
	}
	
	static String getYearFormDate(Date data) {
		data.year + 1900
	}
	
	static int getNumeroMaxProtocollo(def listaNumeri){
		def partialNum = 0;
		listaNumeri.each {
			def countAppo = Integer.parseInt(it.numeroProtocollo.getAt(8..14)) 
			if( countAppo > partialNum)
			partialNum = countAppo
		}
		return partialNum
		
	}
	
	
}
