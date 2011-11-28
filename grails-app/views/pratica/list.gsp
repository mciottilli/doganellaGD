
<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                           
                        
                            <g:sortableColumn property="numeroProtocollo" title="${message(code: 'pratica.numeroProtocollo.label', default: 'Numero Protocollo')}" />
                        
                            <g:sortableColumn property="data" title="${message(code: 'pratica.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="descrizione" title="${message(code: 'pratica.descrizione.label', default: 'Descrizione')}" />
                        
                            <g:sortableColumn property="note" title="${message(code: 'pratica.note.label', default: 'Note')}" />
                        
                            <th><g:message code="pratica.fruitore.label" default="Fruitore" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${praticaInstanceList}" status="i" var="praticaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                        
                            <td><g:link action="show" id="${praticaInstance.id}">${fieldValue(bean: praticaInstance, field: "numeroProtocollo")}</g:link></td>
                        
                            <td><g:formatDate format="dd/MM/yyyy" date="${praticaInstance.data}" /></td>
                        
                            <td>${fieldValue(bean: praticaInstance, field: "descrizione")}</td>
                        
                            <td>${fieldValue(bean: praticaInstance, field: "note")}</td>
                        
                            <td>${fieldValue(bean: praticaInstance, field: "fruitore")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${praticaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
