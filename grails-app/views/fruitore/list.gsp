
<%@ page import="it.solvingteam.doganellaGD.core.Fruitore" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fruitore.label', default: 'Fruitore')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'fruitore.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'fruitore.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="cognome" title="${message(code: 'fruitore.cognome.label', default: 'Cognome')}" />
                        
                            <g:sortableColumn property="dataNascita" title="${message(code: 'fruitore.dataNascita.label', default: 'Data Nascita')}" />
                        
                            <g:sortableColumn property="codice" title="${message(code: 'fruitore.codice.label', default: 'Codice')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fruitoreInstanceList}" status="i" var="fruitoreInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${fruitoreInstance.id}">${fieldValue(bean: fruitoreInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: fruitoreInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: fruitoreInstance, field: "cognome")}</td>
                        
                            <td><g:formatDate date="${fruitoreInstance.dataNascita}" /></td>
                        
                            <td>${fieldValue(bean: fruitoreInstance, field: "codice")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${fruitoreInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
