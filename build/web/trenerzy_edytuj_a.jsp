<%-- 
    Document   : index
    Created on : 2016-01-04, 18:46:18
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylecss.css" />
        <script src="trenerzy.js" language=javascript type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplikacja LIGA PIŁKARSKA</title>
        </head>
    <body link="white" vlink="white" alink="green">
<div id="strona">
    <font color="white"><%
    if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) {
%>
Nie jesteś zalogowany<br/>
<a href="index.jsp">Zaloguj się!</a>
<%} else {
%>
Witaj <%=session.getAttribute("user")%>
<a href='logout.jsp'>Wyloguj</a>
<%
    }
%></font>
<div id="naglowek">
TRENERZY
<img src="tren.png" width="80" align="center" />
</div>
<% 
String s = session.getAttribute("role").toString();
if(s.equals("1")) { %>
<div id="menu_2">
<ul>
<li> <span><a href="index2.jsp"> Strona główna </a></span></li>
<li> 
<span><a href="zawodnicy.jsp"> Zawodnicy </a></span>
<ul>
<li> <a href="zawodnicy_dodaj.jsp"> Nowy zawodnik </a></li>
<li> <a href="zawodnicy_edytuj.jsp"> Edytuj zawodnika </a></li>
<li> <a href="zawodnicy_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li> 
<span><a href="kluby.jsp"> Kluby </a></span>
<ul>
<li> <a href="kluby_dodaj.jsp"> Nowy klub </a></li>
<li> <a href="kluby_edytuj.jsp"> Edytuj klub </a></li>
<li> <a href="kluby_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li><span><a href="trenerzy.jsp"> Trenerzy </a></span>
<ul>
<li> <a href="trenerzy_dodaj.jsp"> Nowy trener </a></li>
<li> <a href="trenerzy_edytuj.jsp"> Edytuj trenera </a></li>
<li> <a href="trenerzy_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li> <span><a href="stadiony.jsp"> Stadiony </a></span>
<ul>
<li> <a href="stadiony_dodaj.jsp"> Nowy stadion </a></li>
<li> <a href="stadiony_edytuj.jsp"> Edytuj stadion </a></li>
<li> <a href="stadiony_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
</ul>
</div>
<%  } %>
<% String s2 = session.getAttribute("role").toString();
if(s2.equals("2")) { %>
<div id="menu_2">
<ul>
<li> <span><a href="index2.jsp"> Strona główna </a></span></li>
<li> 
<span><a href="zawodnicy.jsp"> Zawodnicy </a></span>
<ul>
<li> <a href="zawodnicy_edytuj.jsp"> Edytuj zawodnika </a></li>
<li> <a href="zawodnicy_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li> 
<span><a href="kluby.jsp"> Kluby </a></span>
<ul>
<li> <a href="kluby_edytuj.jsp"> Edytuj klub </a></li>
<li> <a href="kluby_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li><span><a href="trenerzy.jsp"> Trenerzy </a></span>
<ul>
<li> <a href="trenerzy_edytuj.jsp"> Edytuj trenera </a></li>
<li> <a href="trenerzy_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li> <span><a href="stadiony.jsp"> Stadiony </a></span>
<ul>
<li> <a href="stadiony_edytuj.jsp"> Edytuj stadion </a></li>
<li> <a href="stadiony_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
</ul>
</div>
<%  } %>
<% String s3 = session.getAttribute("role").toString();
if(s3.equals("3")) { %>
<div id="menu_2">
<ul>
<li> <span><a href="index2.jsp"> Strona główna </a></span></li>
<li> 
<span><a href="zawodnicy.jsp"> Zawodnicy </a></span>
<ul>
<li> <a href="zawodnicy_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li> 
<span><a href="kluby.jsp"> Kluby </a></span>
<ul>
<li> <a href="kluby_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li><span><a href="trenerzy.jsp"> Trenerzy </a></span>
<ul>
<li> <a href="trenerzy_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
<li> <span><a href="stadiony.jsp"> Stadiony </a></span>
<ul>
<li> <a href="stadiony_ciekaw.jsp"> Ciekawostki </a></li>
</ul>
</li>
</ul>
</div>
<%  } %>
<div id="zawartosc">
   <%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("imie");    
    String sname = request.getParameter("nazwisko");
    String path = getServletContext().getRealPath("/");
    Class.forName("org.sqlite.JDBC");
    Connection conn1 =
                     DriverManager.getConnection("jdbc:sqlite:" + path +"liga.db");
                Statement sta = conn1.createStatement();
    ResultSet rs;
    rs = sta.executeQuery("select * from TRENERZY where IMIĘ='" + name + "' and NAZWISKO='" + sname + "'");
    if (rs.next()) {
        %>
       <form method="post" action="trenerzy_zapisz.jsp?ID_T=<%=rs.getString("ID_TRENERA")%>" onsubmit='return validation()'> 
<center>
            <table border="0" width="40%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Edytuj dane trenera</th>
                    </tr>
                </thead>
                <tbody>
    <tr>
        <td>
                ID Trenera </td>
                <td ><%=rs.getString("ID_TRENERA")%></td>
    </tr>
    
    <tr>
        <td>
                Imię </td>
                <td><input type="text" name="imie" id="imie" value="<%=rs.getString("IMIĘ")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Nazwisko</td>
                <td><input type="text" name="nazwisko" id="nazwisko" value="<%=rs.getString("NAZWISKO")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Data urodzenia </td>
                <td><input type="text" name="data_urodz" id="data_urodz" value="<%=rs.getString("DATA_UR")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Kraj </td>
                <td><input type="text" name="kraj" id="kraj" value="<%=rs.getString("KRAJ")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Data wygaśnięcia kontraktu </td>
                <td><input type="text" name="kont_wyg" id="kont_wyg" value="<%=rs.getString("KONT_WYG")%>" required="required"></td>
    </tr>
    <td></td>
    <td><input type="submit" value="Zapisz"></td>
    </tbody>
</table>
</form> 
       
        <%
    } else {
        out.println("Nie ma takiego trenera <a href='trenerzy_edytuj.jsp'><font color='black'>Spróbuj ponownie</font></a></br></br> "
                + "<img src='blad.png' width='300' />");
    }
    conn1.close();
%>    
</div>
<div id="stopka">
WSIiZ Inżynieria produkcji oprogramowania 2017
</div>
</div>
</body>
</html>
