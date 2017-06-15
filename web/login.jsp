<%-- 
    Document   : index
    Created on : 2016-01-04, 18:46:18
    Author     : Paweł
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styless.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplikacja LIGA PIŁKARSKA</title>
        </head>
    <body link="white" vlink="white" alink="green">
        </br>
        </br>
<center><%
    Connection conn1 = null;
    PreparedStatement preparedStatement = null;
    String user = request.getParameter("nazwa");    
    String pwd = request.getParameter("haslo");
    String path = getServletContext().getRealPath("/");
    Class.forName("org.sqlite.JDBC");
    conn1 = DriverManager.getConnection("jdbc:sqlite:" + path +"liga.db");
    String selectSQL = "select * from USERS where nazwa= ? and haslo= ?";
                preparedStatement = conn1.prepareStatement(selectSQL);
                preparedStatement.setString(1, user);
                preparedStatement.setString(2, pwd);
    ResultSet rs = preparedStatement.executeQuery();
    if (rs.next()) {
        session.setAttribute("user", user);
        session.setAttribute("role", rs.getInt(3));
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index2.jsp");
    } else {
        out.println("<font color='white'>Zła nazwa użytkownika lub hasło <a href='index.jsp'>Spróbuj ponownie</a></font>");
    }
    conn1.close();
%></center>
    
</body>
</html>
