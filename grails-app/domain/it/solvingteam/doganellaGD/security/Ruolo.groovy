package it.solvingteam.doganellaGD.security

class Ruolo {

	static final String ROLE_ADMIN = "ROLE_ADMIN"
	static final String ROLE_USER = "ROLE_USER"
	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
