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
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><a class="logout" href="${createLink(uri: '/')}"><g:message code="default.logout.label"/></a></span>
    </div>

<g:layoutBody/>
</body>
</html>