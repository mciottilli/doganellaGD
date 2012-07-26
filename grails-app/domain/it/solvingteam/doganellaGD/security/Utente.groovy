package it.solvingteam.doganellaGD.security

class Utente {

	transient springSecurityService

	String username
	String password
	String nome 
	String cognome
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password (blank: false)
		nome(nullable:false)
		cognome(nullable:false)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Ruolo> getAuthorities() {
		UtenteRuolo.findAllByUtente(this).collect { it.ruolo } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
