<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
        <meta charset=ISO-8859-1">
</head>
<body>
<h1>
	Wejd? do magazynu  
</h1>

<P>  Czas na serwerze: ${serverTime}. </P>

<ul>
		<li>
			<a href="<c:url value="/magazyn" />" >Magazyn</a>
		</li>
                
</ul>
</body>
</html>
