<html>
<head>
    <title>GD</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" media="all" type="text/css"
          href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
    <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>

    <script>
        $(function() {
            $("#tabs").tabs({ajaxOptions:{cache:false},cache:false})
        });
    </script>
    <g:jqDatepickerLocale lang="it"/>

</head>

<body>
<div class="body">
<h1>Home</h1>
    <div id="tabs">
        <ul>
            <li><a href="#tabs-cerca"><g:message code="tabs.gestione.pratiche"/></a></li>
            <li><a href="#tabs-fruitori"><g:message code="tabs.gestione.fruitori"/></a></li>
            <li><a href="#tabs-contenziosi"><g:message code="tabs.gestione.contenziosi"/></a></li>
        </ul>


        <div id="tabs-cerca">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${praticaInstance}">
                <div class="errors">
                    <g:renderErrors bean="${praticaInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form method="post" controller="pratica">

                <div class="dialog">
                    <table>
                        <tbody>

				<tr class="prop">
                    <td class="name">
                        <label for="stato.id"><g:message code="pratica.stato.label" default="Stato"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'stato', 'errors')}">
                        <g:radioGroup values="${it.solvingteam.doganellaGD.core.StatoPratica.list()*.id}" name="stato.id" labels="['Pregressa','Ingresso','Uscita']" >
                        ${it.radio} ${it.label}
                        </g:radioGroup>
                    </td>
                </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label"
                                                                         default="Numero Protocollo"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="dataAcquisizione"><g:message code="pratica.dataAcquisizione.label" default="Data Acquisizione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'dataAcquisizione', 'errors')}">

                                <g:jqDatepicker name="dataAcquisizione" changeMonth="true" changeYear="true"/>
                            </td>
                        </tr>
                         <tr class="prop">
                            <td class="name">
                                <label for="dataAccettazione"><g:message code="pratica.dataAccettazione.label" default="Data Accettazione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'dataAccettazione', 'errors')}">

                                <g:jqDatepicker name="dataAccettazione" changeMonth="true" changeYear="true"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="descrizione"><g:message code="pratica.descrizione.label"
                                                                    default="Descrizione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'descrizione', 'errors')}">
                                <g:textField name="descrizione" value="${praticaInstance?.descrizione}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td class="name">
                                <label for="descrizione"><g:message code="pratica.numeroPosizione.label" default="Numero Posizione" /></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroPosizione', 'errors')}">
                                <g:textField name="numeroPosizione" value="${praticaInstance?.numeroPosizione}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="fruitore"><g:message code="pratica.fruitore.label" default="Nome Cognome Codice" /></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                <g:textField name="nomecognome"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="result"
                                                         value="${message(code: 'default.button.search.label', default: 'Cerca')}"/></span>
                    <span class="button"><g:actionSubmit class="save" action="createChoose"
                                                         value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
                </div>
            </g:form>
        </div>

       <div id="tabs-fruitori">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fruitoreInstance}">
                <div class="errors">
                    <g:renderErrors bean="${fruitoreInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form controller="fruitore">
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td class="name">
                                <label for="nome"><g:message code="fruitore.nome.label" default="Nome"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: fruitoreInstance, field: 'nome', 'errors')}">
                                <g:textField name="nome" value="${fruitoreInstance?.nome}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="cognome"><g:message code="fruitore.cognome.label"
                                                                default="Cognome"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: fruitoreInstance, field: 'cognome', 'errors')}">
                                <g:textField name="cognome" value="${fruitoreInstance?.cognome}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="codice"><g:message code="fruitore.codice.label" default="Codice"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: fruitoreInstance, field: 'codice', 'errors')}">
                                <g:textField name="codice" value="${fruitoreInstance?.codice}"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="result"
                                                         value="${message(code: 'default.button.search.label', default: 'Cerca')}"/></span>
                    <span class="button"><g:actionSubmit class="save" action="create"
                                                         value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
                </div>
            </g:form>
        </div>

        <div id="tabs-contenziosi">
             <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${praticaInstance}">
                <div class="errors">
                    <g:renderErrors bean="${praticaInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form method="post" controller="pratica">
			
                <div class="dialog">
                    <table>
                        <tbody>
				<tr class="prop">
                    <td class="name">
                        <label for="stato.id"><g:message code="pratica.stato.label" default="Stato"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'stato', 'errors')}">
                        <g:radioGroup values="${it.solvingteam.doganellaGD.core.StatoPratica.list()*.id}" name="stato.id" labels="['Pregressa','Ingresso','Uscita']" >
                        ${it.radio} ${it.label}
                        </g:radioGroup>
                    </td>
                </tr>
                        <tr class="prop">
                            <td class="name">
                                <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label"
                                                                         default="Numero Protocollo"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                            </td>
                        </tr>

                         <tr class="prop">
                            <td class="name">
                                <label for="dataAcquisizione"><g:message code="pratica.dataAcquisizione.label" default="Data Acquisizione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'dataAcquisizione', 'errors')}">

                                <g:jqDatepicker name="dataAcquisizione" changeMonth="true" changeYear="true"/>
                            </td>
                        </tr>
                         <tr class="prop">
                            <td class="name">
                                <label for="dataAccettazione"><g:message code="pratica.dataAccettazione.label" default="Data Accettazione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'dataAccettazione', 'errors')}">

                                <g:jqDatepicker name="dataAccettazione" changeMonth="true" changeYear="true"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="descrizione"><g:message code="pratica.descrizione.label"
                                                                    default="Descrizione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'descrizione', 'errors')}">
                                <g:textField name="descrizione" value="${praticaInstance?.descrizione}"/>
                            </td>
                        </tr>
 					<tr class="prop">
                            <td class="name">
                                <label for="descrizione"><g:message code="pratica.numeroPosizione.label" default="Numero Posizione" /></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroPosizione', 'errors')}">
                                <g:textField name="numeroPosizione" value="${praticaInstance?.numeroPosizione}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td class="name">
                                <label for="fruitore"><g:message code="pratica.fruitore.label" default="Nome Cognome Codice" /></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                <g:textField name="nomecognome"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="resultContenzioso" value="${message(code: 'default.button.search.label', default: 'Cerca')}"/></span>
                </div>
            </g:form>
        </div>

   </div>
</div>

</body>
</html>
