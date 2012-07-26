<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}"/>
    <title><g:message code="label.pratica.lista" /></title>
     <link rel="stylesheet" media="all" type="text/css" href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
   
    
</head>

<body>

<div class="body">
    <h1><g:message code="label.pratica.lista" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
   
		            <div class="list">
		            <g:if test="${praticaInstanceList}">
		        <table>
		            <thead>
		            <tr>
		
		                <g:sortableColumn property="numeroProtocollo"
		                                  title="${message(code: 'pratica.numeroProtocollo.label', default: 'Numero Protocollo')}"/>
		
                		<g:sortableColumn property="dataAcquisizione" title="${message(code: 'pratica.dataAcquisizione.label', default: 'Data Acquisizione')}"/>
                
                		<g:sortableColumn property="dataAccettazione" title="${message(code: 'pratica.dataAccettazione.label', default: 'Data Accettazione')}"/>
		
		                <g:sortableColumn property="descrizione"
		                                  title="${message(code: 'pratica.descrizione.label', default: 'Descrizione')}"/>
		
		                <g:sortableColumn property="note" title="${message(code: 'pratica.note.label', default: 'Note')}"/>
		
		                <th><g:message code="pratica.fruitore.label" default="Fruitore"/></th>
		                
		                 <th>Dettaglio</th>
		
		            </tr>
		            </thead>
		            <tbody>
		            <g:each in="${praticaInstanceList}" status="i" var="praticaInstance">
		                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		
		                    <td>${fieldValue(bean: praticaInstance, field: "numeroProtocollo")}</td>
		                   
                    		<td><g:formatDate format="dd/MM/yyyy" date="${praticaInstance.dataAcquisizione}"/></td>
                    
                    		<td><g:formatDate format="dd/MM/yyyy" date="${praticaInstance.dataAccettazione}"/></td>
		
		                    <td>${fieldValue(bean: praticaInstance, field: "descrizione")}</td>
		
		                    <td>${fieldValue(bean: praticaInstance, field: "note")}</td>
		
		                    <td>${fieldValue(bean: praticaInstance, field: "fruitore")}</td>
							<td><g:link action="show"  params="[max:params.max,offset:params.offset,contenzioso:'si']" id="${praticaInstance.id}"><img src="${resource(dir:'images/skin',file:'database_show.png')}" alt="${message(code: 'default.label.table.detail')}" border="0" title="${message(code: 'default.label.table.detail')}" /></g:link></td>
		                </tr>
		            </g:each>
		            </tbody>
		        </table>
			    <div class="paginateButtons">
			        <g:paginate total="${praticaInstanceTotal}"/>
			    </div>
			    </g:if>
		        <g:else>
	    	 		<div class="message"><g:message code="ricerca.noResult"/></div>
	    		</g:else>
	    		<g:form>
	      			<div class="buttons">
             			<span class="button"><g:actionSubmit class="save" action="createChoose" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
          			</div>
    			</g:form>
		    </div>
		        </div>
 
</body>
</html>
