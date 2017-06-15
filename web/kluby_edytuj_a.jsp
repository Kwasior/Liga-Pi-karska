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
        <script src="kluby.js" language=javascript type="text/javascript"></script>
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
KLUBY
<img src="klub.png" width="50" align="center" />
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
    Connection conn1 = null;
    PreparedStatement preparedStatement = null;
    request.setCharacterEncoding("UTF-8");
    String snklubu = request.getParameter("nklubu");    
    String sstrona = request.getParameter("miasto");
    String path = getServletContext().getRealPath("/");
    Class.forName("org.sqlite.JDBC");
    conn1 = DriverManager.getConnection("jdbc:sqlite:" + path +"liga.db");
    String selectSQL = "select * from KLUBY where NAZWA_KLUBU= ? and MIASTO= ?";
                preparedStatement = conn1.prepareStatement(selectSQL);
                preparedStatement.setString(1, snklubu);
                preparedStatement.setString(2, sstrona);
    ResultSet rs = preparedStatement.executeQuery();
    if (rs.next()) {
        %>
       <form method="post" action="kluby_zapisz.jsp?ID_K=<%=rs.getString("ID_KLUBU")%>" onsubmit='return validation()'> 
<center>
            <table border="0" width="40%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Edytuj dane klubu</th>
                    </tr>
                </thead>
                <tbody>
    <tr>
        <td>
                ID Klubu </td>
                <td ><%=rs.getString("ID_KLUBU")%></td>
    </tr>
    
    <tr>
        <td>
                Nazwa klubu </td>
                <td><input type="text" name="nklubu" id="nklubu" value="<%=rs.getString("NAZWA_KLUBU")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Strona WWW </td>
                <td><input type="text" name="strona_www" id="strona_www" value="<%=rs.getString("STRONA_WWW")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Miasto </td>
                <td><input type="text" name="miasto" id="miasto" value="<%=rs.getString("MIASTO")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Mistrz </td>
                <td><input type="text" name="mistrz" id="mistrz" maxlength="2" value="<%=rs.getInt("MISTRZ")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                Puchar </td>
                <td><input type="text" name="puchar" id="puchar" maxlength="2" value="<%=rs.getInt("PUCHAR")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                ID Stadionu </td>
                <td><input type="text" name="id_stadionu" id="id_stadionu" value="<%=rs.getString("ID_STADION")%>" required="required"></td>
    </tr>
    
    <tr>
        <td>
                ID Trenera </td>
                <td><input type="text" name="id_trenera" id="id_trenera" value="<%=rs.getString("ID_TRENERA")%>" required="required"></td>
    </tr>
    <td></td>
    <td><input type="submit" value="Zapisz"></td>
    </tbody>
</table>
</form> 
       
        <%
    } else {
        out.println("Nie ma takiego klubu <a href='kluby_edytuj.jsp'><font color='black'>Spróbuj ponownie</font></a></br></br> "
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
