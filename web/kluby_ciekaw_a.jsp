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
<tbody>
            <%
                Connection conn = null;
                PreparedStatement preparedStatement = null;
                request.setCharacterEncoding("UTF-8");
                String kraj = request.getParameter("kraj");    
                Class.forName("org.sqlite.JDBC");
                String path = getServletContext().getRealPath("/");
                conn = DriverManager.getConnection("jdbc:sqlite:" + path +"liga.db");
                String selectSQL = "select * from KLUBY join TRENERZY on TRENERZY.ID_TRENERA=KLUBY.ID_TRENERA where KRAJ= ?";
                preparedStatement = conn.prepareStatement(selectSQL);
                preparedStatement.setString(1, kraj);
                ResultSet rs = preparedStatement.executeQuery();
                      
                if(rs.next()){
                out.println("<g>" + "Lista obejmująca wszystkie kluby posiadające trenerów z " + kraj + "</g>");
                %>
                <table rules="all" width="75%" cellpadding="3" align="center" bgcolor="#cdcdcd" bordercolor="#F3F3F3">
            <thead>
                <tr>
                    <th>Nazwa Klubu</th>
                    <th>Miasto</th>
                    <th>Mistrz</th>
                    <th>Puchar</th>
                    <th>Imię trenera</th>
                    <th>Nazwisko trenera</th>
                    <th>Narodowość</th>
                </tr>
            </thead><%
                }
                else{
                out.println("Nie ma takiego trenera/trenerów <a href='kluby_ciekaw.jsp'><font color='black'>Spróbuj ponownie</font></a></br></br> "
                + "<img src='blad.png' width='300' />");}
                
                ResultSet rs1 = preparedStatement.executeQuery();
                while (rs1.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("NAZWA_KLUBU") + "</td>");
                    out.println("<td>" + rs.getString("MIASTO") + "</td>");
                    out.println("<td>" + rs.getString("MISTRZ") + "</td>");
                    out.println("<td>" + rs.getString("PUCHAR") + "</td>");
                    out.println("<td>" + rs.getString("IMIĘ") + "</td>");
                    out.println("<td>" + rs.getString("NAZWISKO") + "</td>");
                    out.println("<td>" + rs.getString("KRAJ") + "</td>");
                    out.println("</tr>");
                }
                rs.close();
                rs1.close();
                conn.close();
            %>
            </tbody>
        </table>
</div>
<div id="stopka">
WSIiZ Inżynieria produkcji oprogramowania 2017
</div>
</div>
</body>
</html>