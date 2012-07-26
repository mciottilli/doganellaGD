
<%@ page import="it.solvingteam.doganellaGD.security.Utente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'utente.label', default: 'Utente')}" />
        <title>Lista Utenti</title>
    </head>
    <body>
       
        <div class="body">
            <h1>Lista Utenti</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                          <g:sortableColumn property="nome" title="${message(code: 'utente.nome.label', default: 'Nome')}" />
                          <g:sortableColumn property="cognome" title="${message(code: 'utente.cognome.label', default: 'Cognome')}" />
                          <g:sortableColumn property="username" title="${message(code: 'utente.username.label', default: 'Username')}" />
                          <g:sortableColumn property="enabled" title="${message(code: 'utente.enabled.label', default: 'Abilitato')}" />
                          <th class="sortable" style="font-size: 10px;color: #333333;">Dettaglio</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${utenteInstanceList}" status="i" var="utenteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: utenteInstance, field: "nome")}</td>
                            <td>${fieldValue(bean: utenteInstance, field: "cognome")}</td>
                            <td>${fieldValue(bean: utenteInstance, field: "username")}</td>
                            <td><g:formatBoolean boolean="${utenteInstance.enabled}" /></td>
                        	<td><g:link action="show" params="[id:utenteInstance.id,max:params.max,offset:params.offset]"><img src="${resource(dir:'images/skin',file:'database_show.png')}" alt="${message(code: 'default.label.table.detail')}" border="0" title="${message(code: 'default.label.table.detail')}" /></g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${utenteInstanceTotal}" />
            </div>
            <g:form>
             <g:hiddenField name="max" value="${params.max}" />
             <g:hiddenField name="offset" value="${params.offset}" />
	    	<div class="buttons">
	          <span class="button"><g:actionSubmit class="save" action="create" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
	        </div>
	   </g:form>
        </div>
    </body>
</html>
