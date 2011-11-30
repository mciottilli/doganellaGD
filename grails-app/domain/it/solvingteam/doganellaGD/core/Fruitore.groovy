package it.solvingteam.doganellaGD.core

class Fruitore {

    String nome
    String cognome
    Date dataNascita
    String codice

    static constraints = {
        nome(nullable: true)
        cognome(nullable: true)
        dataNascita(nullable: true)
    }

    @Override
    public String toString() {
        return nome + " " + cognome
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
