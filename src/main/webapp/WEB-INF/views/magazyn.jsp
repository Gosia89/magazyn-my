<%@include file="./includes/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html>
    <head>

        <link href="&{pageContext.request.contextPath}/resources/style.css" 
              rel="stylesheet" type="text/css" />
        <title>Magazyn</title>
        <style>
            header {
                background-color:black;
                color:white;
                text-align:center;
                padding:5px;
            }
            .center {
                position: absolute;
                right: 700px;
                top: 98px;
                width: 200px;
                background-color: pink;
            }

            div   {
                width: 300px;
                padding: 10px;
                margin: 0;  
                background-color: yellow;
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
                color: beige;
                background-color: black;
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }
            table#t02 td	{
                border: 1px solid black;
                border-collapse: collapse;
            }

            body {background-color:lightgrey}
            h1   {color:blue; font:arial}
            p    {color:green}
            
            .a2a:link    {color:beige; background-color:transparent}
            .a2a:visited {color:beige; background-color:transparent}
            .a2a:hover   {color:green; background-color:transparent}
            .a2a:active  {color:red; background-color:transparent}
            
            .a2b:link    {color:black; background-color:transparent}
            .a2b:visited {color:black; background-color:transparent}
            .a2b:hover   {color:green; background-color:transparent}
            .a2b:active  {color:red; background-color:transparent}
            
        </style>

    </head>


    <body>
        <header>
            <h1>Magazyn</h1>
        </header>


        <!-- Tutaj powstaje formularz -->

        <div>
            <h3>Dodawanie towaru do magazynu</h3>
            <form:form modelAttribute="towar">

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
                    <tr><td>Ilo&#347&#263:</td> 
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

        <div class="center">
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
        </div>



        <!-- Tutaj dodawane sa nowe towary -->
        <table id="t02">
            <!-- Nag?�wki tabeli towar�w-->
            <tr>
                <th><a href="magazyn?sort=0" class="a2a">Id</a></th>
                <th><a href="magazyn?sort=1" class="a2a">Nazwa</a></th>
                <th><a href="magazyn?sort=2" class="a2a">Opis</a></th>
                <th><a href="magazyn?sort=3" class="a2a">Cena</a></th>
                <th><a href="magazyn?sort=4" class="a2a">Ilo&#347&#263</a></th>
                <th><a href="magazyn?sort=5" class="a2a">Kategoria</a></th>
                <th>Usu&#324</th>
                <th>Zmie&#324</th>
            </tr>
            <!-- z bazy danych wyci?ga do tabeli zapisane towary-->
            <c:forEach var="towar" items="${magazyn}">
                <tr class="a02">
                    <td><c:out value="${towar.id+1}" /></td>
                    <td><c:out value="${towar.nazwa}" /></td>
                    <td><c:out value="${towar.opis}" /></td>
                    <td><c:out value="${towar.cena}" /></td>
                    <td><c:out value="${towar.ilosc}" /></td>
                    <td><c:out value="${towar.kategoria}" /></td>
                    <td><a href="magazyn?id=${towar.id}&action=delete" class="a2b" >Usu&#324;</a></td>
                    <td><a href="magazynzmien?id=${towar.id}&action=update" class="a2b">Zmie&#324;</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>