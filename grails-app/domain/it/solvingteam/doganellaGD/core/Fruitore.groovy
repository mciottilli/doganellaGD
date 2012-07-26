package it.solvingteam.doganellaGD.core

class Fruitore {

    String nome
    String cognome
    Date dataNascita
    String codice

    static constraints = {
        nome(nullable: false)
        cognome(nullable: false)
        dataNascita(nullable: false)
    }

    @Override
    public String toString() {
        return codice + " " + nome + " " + cognome
    }

    def static cercaFruitore(cmd, params) {
        def c = Fruitore.createCriteria()

        def results = c.list(params) {
            if (cmd.nome) {
                ilike 'nome', "%${cmd.nome}%"
            }
            if (cmd.cognome) {
                ilike 'cognome', "%${cmd.cognome}%"
            }
            if (cmd.codice) {
                ilike 'codice', "%${cmd.codice}%"
            }

        }
    }
}
