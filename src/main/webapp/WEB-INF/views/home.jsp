<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <div align="center">
        <h1>Wejdź do magazynu</h1>

<P>  Czas na serwerze: ${serverTime}. </P>

<ul>
		<li>
			<a href="<c:url value="/magazyn" />" >Magazyn</a>
		</li>
                
</ul>
    </div>
</body>
</html>
