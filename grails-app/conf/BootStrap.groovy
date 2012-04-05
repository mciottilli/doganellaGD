import it.solvingteam.doganellaGD.core.Fruitore;
import it.solvingteam.doganellaGD.core.Pratica;
import it.solvingteam.doganellaGD.core.StatoPratica;
import it.solvingteam.doganellaGD.security.*;

class BootStrap {

    def init = { servletContext ->
		log.info "ciaoo"
		//prepareUserRole()
		setupDati()
    }
    def destroy = {
    }
	
	
	private void prepareUserRole(){
		def adminRole = Ruolo.findByAuthority(Ruolo.ROLE_ADMIN)
		if (!adminRole) {
		 adminRole = new Ruolo(authority: Ruolo.ROLE_ADMIN, name: 'Admin')
		 adminRole.save(failOnError: true)
		}
		
		def userRole = Ruolo.findByAuthority(Ruolo.ROLE_USER)
		if (!userRole) {
		 userRole = new Ruolo(authority: Ruolo.ROLE_USER, name: 'User')
		 userRole.save(failOnError: true)
		}
		
  
		def testUser = new Utente(username: 'admin', enabled: true,
			 password: '222')
	
		testUser.save(flush: true)
		
		def testUser2 = new Utente(username: 'user', enabled: true,
			 password: '222')
		testUser2.save(flush: true)
  
		UtenteRuolo.create testUser, adminRole, true
		UtenteRuolo.create testUser2, userRole, true
		
		RequestMap.findByUrlAndConfigAttribute('/**', 'IS_AUTHENTICATED_FULLY')?:new RequestMap(url:'/**', configAttribute:'IS_AUTHENTICATED_FULLY').save()
		RequestMap.findByUrlAndConfigAttribute('/login/**', 'IS_AUTHENTICATED_ANONYMOUSLY')?:new RequestMap(url:'/login/**', configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		RequestMap.findByUrlAndConfigAttribute('/logout/**', 'IS_AUTHENTICATED_ANONYMOUSLY')?:new RequestMap(url:'/logout/**', configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		RequestMap.findByUrlAndConfigAttribute('/images/**', 'IS_AUTHENTICATED_ANONYMOUSLY')?:new RequestMap(url:'/images/**', configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		RequestMap.findByUrlAndConfigAttribute('/css/**', 'IS_AUTHENTICATED_ANONYMOUSLY')?:new RequestMap(url:'/css/**', configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		RequestMap.findByUrlAndConfigAttribute('/js/**', 'IS_AUTHENTICATED_ANONYMOUSLY')?:new RequestMap(url:'/js/**', configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		RequestMap.findByUrlAndConfigAttribute('/plugins/**', 'IS_AUTHENTICATED_ANONYMOUSLY')?:new RequestMap(url:'/plugins/**', configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		
	}
	
	private void setupDati(){
		
		def statoPratica1 = new StatoPratica(descrizione:"Pregressa").save(flush:true)
		def statoPratica2 = new StatoPratica(descrizione:"Ingresso").save(flush:true)
		def statoPratica3 = new StatoPratica(descrizione:"Uscita").save(flush:true)
		Date date = Date.parse("dd/MM/yyyy","05/04/2012")
		Date date2 = Date.parse("dd/MM/yyyy","05/03/2012")
		
		
		def fruitore1 = new Fruitore(nome:"nome1",cognome:"cognome1",dataNascita:date,codice:"cod1").save(flush:true)
		def fruitore2 = new Fruitore(nome:"nome2",cognome:"cognome2",dataNascita:date,codice:"cod2").save(flush:true)
		
		def pratica1 = new Pratica(fruitore:fruitore1,dataAcquisizione:date,descrizione:"desc1",note:"note1",contenzioso:true,stato:statoPratica2,numeroProtocollo:"DOGI20120000002").save(flush:true)
		def pratica2 = new Pratica(fruitore:fruitore2,dataAcquisizione:date2,descrizione:"desc2",note:"note2",stato:statoPratica2,numeroProtocollo:"DOGI20120000001").save(flush:true)
		
		
		
				
				
				
				
	}
}
