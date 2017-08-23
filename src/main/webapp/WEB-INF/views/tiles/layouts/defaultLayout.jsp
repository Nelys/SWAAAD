<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:getAsString name="title" /></title>
<%-- 	<link href="<c:url value='/resources/css/bootstrap.css' />"  rel="stylesheet"></link> --%>
<%-- 	<link href="<c:url value='/resources/css/app.css' />" rel="stylesheet"></link> --%>
</head>
 
<body>
		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>
	
		<section id="sidemenu">
			<tiles:insertAttribute name="menu" />
		</section>
			
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>
		
<!-- 		<footer id="footer"> -->
<%-- 			<tiles:insertAttribute name="footer" /> --%>
<!-- 		</footer> -->
</body>
</html>