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
    <div id="tabs">
        <ul>
            <li><a href="#tabs-cerca">Cerca</a></li>
            <li><a href="#tabs-fruitori">Gestione Fruitori</a></li>
            <li><a href="#tabs-contenziosi">Gestione Contenziosi</a></li>
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
                                <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label"
                                                                         default="Numero Protocollo"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="data"><g:message code="pratica.data.label" default="Data"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'data', 'errors')}">

                                <g:jqDatepicker name="data" changeMonth="true" changeYear="true"/>
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
                                <label for="fruitore"><g:message code="pratica.fruitore.label"
                                                                 default="Nome Cognome"/></label>
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
                    <span class="button"><g:actionSubmit class="save" action="create"
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
            lorem ipsum deo gratias
        </div>

    </div>
</div>

</body>
</html>
