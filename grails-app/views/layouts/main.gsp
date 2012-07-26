<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: '')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
</head>

<body>

<div id="headerLogo"><img src="${resource(dir: 'images', file: 'logoDoganella.png')}" alt="Doganella" border="0"/></div>
 <div>
   <ul class="menu">
	<li class="top"><g:link action="searchPratiche" controller="pratica" class="top_link"><span>Pratiche</span></g:link></li>
	<li class="top"><g:link action="search" controller="fruitore" class="top_link"><span>Fruitori</span></g:link></li>
	<li class="top"><g:link action="searchContenziosi" controller="pratica" class="top_link"><span>Contenziosi</span></g:link></li>
	<li class="top"><g:link  controller="utente" class="top_link"><span>Utenti</span></g:link></li>
	<li class="top"><g:link controller="logout" class="top_link"><span><g:message code="default.logout.label"/></span></g:link></li>
   </ul>
</div>		

<g:layoutBody/>
</body>
</html>