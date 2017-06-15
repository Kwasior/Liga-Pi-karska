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
  <tbody>
            <%
                
                request.setCharacterEncoding("UTF-8");
                String miasto = request.getParameter("miasto");    
                Class.forName("org.sqlite.JDBC");
                String path = getServletContext().getRealPath("/");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:" + path +"liga.db");
                Statement stat = conn.createStatement();
                
                ResultSet rs;
                rs = stat.executeQuery("select * from TRENERZY join KLUBY on TRENERZY.ID_TRENERA=KLUBY.ID_TRENERA where MIASTO='" + miasto + "'");
                      
                if(rs.next()){
                out.println("<g>" + "Lista obejmująca wszystkich obecnych trenerów zespołów z miasta " + rs.getString("MIASTO")+ "</g>");
                %>
                <table rules="all" width="95%" cellpadding="3" align="center" bgcolor="#cdcdcd" bordercolor="#F3F3F3">
            <thead>
                <tr>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                    <th>Data Urodzenia</th>
                    <th>Narodowość</th>
                    <th>Data Wygaśnięcia Kontraktu</th>
                    <th>Nazwa Klubu</th>
                    <th>Miasto Klubu</th>
                    </tr>
            </thead><%
                }
                else{
                out.println("Nie ma takiego trenera/trenerów <a href='trenerzy_ciekaw.jsp'><font color='black'>Spróbuj ponownie</font></a></br></br> "
                + "<img src='blad.png' width='300' />");}
                
               ResultSet rs1 = stat.executeQuery("select * from TRENERZY join KLUBY on TRENERZY.ID_TRENERA=KLUBY.ID_TRENERA where MIASTO='" + miasto + "'");
                while (rs1.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("IMIĘ") + "</td>");
                    out.println("<td>" + rs.getString("NAZWISKO") + "</td>");
                    out.println("<td>" + rs.getString("DATA_UR") + "</td>");
                    out.println("<td>" + rs.getString("KRAJ") + "</td>");
                    out.println("<td>" + rs.getString("KONT_WYG") + "</td>");
                    out.println("<td>" + rs.getString("NAZWA_KLUBU") + "</td>");
                    out.println("<td>" + rs.getString("MIASTO") + "</td>");
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
