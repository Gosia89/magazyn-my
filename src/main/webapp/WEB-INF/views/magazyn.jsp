<%@include file="./includes/common.jsp"%>
<!DOCTYPE>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Magazyn</title>
        <style>
            div   {
                alignment-adjust: center;
                width: 300px;
                padding: 10px;
                margin: 0;  
            }
            table {
                width:100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                text-align: left;
            }
            table#t02 tr:nth-child(even) {
                background-color: #eee;
                border: 1px solid black;
                border-collapse: collapse;
            }
            table#t02 tr:nth-child(odd) {
                background-color:#fff;
                border: 1px solid black;
                border-collapse: collapse;
            }
            table#t02 th	{
                background-color: black;
                border: 1px solid black;
                border-collapse: collapse;
            }
            table#t02 td	{
                 border: 1px solid black;
                border-collapse: collapse;
            }

            body {background-color:lightgrey}
            h1   {color:blue; font:arial}
            p    {color:green}
            a:link    {color:#000000; background-color:transparent}
            a:visited {color:#002EB8; background-color:transparent}
            a:hover   {color:#3D3D3D; background-color:transparent}
            a:active  {color:#990000; background-color:transparent}
        </style>

    </head>


    <body>
        <h1>Magazyn</h1>
        <h3>Dodawanie towaru do magazynu</h3>
        <!-- Tutaj powstaje formularz -->

        <form:form modelAttribute="towar">
            <div>
                <table id="t01">
                <tr><td>Nazwa:</td> 
                    <td><form:input path="nazwa" /></td>
                </tr>
                <tr><td>Opis:</td> 
                    <td><form:input path="opis" /></td>
                </tr>
                <tr><td>Cena:</td> 
                    <td><form:input path="cena" /></td>
                </tr>
                <tr><td>Ilosc:</td> 
                    <td><form:input path="ilosc" /></td>
                </tr>
                <tr><td>Kategoria:</td> 
                    <td><form:input path="kategoria" /></td></tr>
                </table>
            </div>
            <input type="submit" value="Dodaj" formaction="magazyn"
                   formmethod="post" />

        </form:form>


        <!-- Tutaj s? wybrane kategorie filtrowania -->
        <h3>Filtruj wg:</h3>
        <form action="magazyn" method="get">
            <select name="kategoria">
                <option value="1" >Nazwa</option>
                <option value="2" >Opis</option>
                <option value="5" >Kategoria</option>
            </select><br>
            <input type="text" value=".*" name="wyrazenie" ><br> 
            <input type="submit" name="filter" value="Filtruj" >

        </form>


        <!-- Tutaj dodawane sa nowe towary -->
        <table id="t02">
            <!-- Nag?ówki tabeli towarów-->
            <tr>
                <th><a href="magazyn?sort=0">Id</a></th>
                <th><a href="magazyn?sort=1">Nazwa</a></th>
                <th><a href="magazyn?sort=2">Opis</a></th>
                <th><a href="magazyn?sort=3">Cena</a></th>
                <th><a href="magazyn?sort=4">Ilosc</a></th>
                <th><a href="magazyn?sort=5">Kategoria</a></th>
                <th>Usu&#324;</th>
                <th>Zmie&#324;</th>
            </tr>
            <!-- z bazy danych wyci?ga do tabeli zapisane towary-->
            <c:forEach var="towar" items="${magazyn}">
                <tr>
                    <td><c:out value="${towar.id+1}" /></td>
                    <td><c:out value="${towar.nazwa}" /></td>
                    <td><c:out value="${towar.opis}" /></td>
                    <td><c:out value="${towar.cena}" /></td>
                    <td><c:out value="${towar.ilosc}" /></td>
                    <td><c:out value="${towar.kategoria}" /></td>
                    <td><a href="magazyn?id=${towar.id}&action=delete">Usu&#324;</a></td>
                    <td><a href="magazynzmien?id=${towar.id}&action=update">Zmie&#324;</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>