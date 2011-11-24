import it.solvingteam.doganellaGD.core.Fruitore;
import it.solvingteam.doganellaGD.core.Pratica;
import it.solvingteam.doganellaGD.security.*;

class BootStrap {

    def init = { servletContext ->
		prepareUserRole()
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
		Date date = Date.parse("dd/MM/yyyy","25/11/2011")
		
		def pratica1 = new Pratica(numeroProtocollo:"numProto1",data:date,descrizione:"desc1",note:"note1").save(flush:true)
		def pratica2 = new Pratica(numeroProtocollo:"numProto2",data:date,descrizione:"desc2",note:"note2").save(flush:true)
		
		def fruitore1 = new Fruitore(nome:"nome1",cognome:"cognome1",dataNascita:date,codice:"cod1").save(flush:true)
		def fruitore2 = new Fruitore(nome:"nome2",cognome:"cognome2",dataNascita:date,codice:"cod2").save(flush:true)
		
		pratica1.fruitore = fruitore1;
		pratica2.fruitore = fruitore2		
				
				
				
				
	}
}
