<%-- 
    Document   : index
    Created on : 2016-01-04, 18:46:18
    Author     : Paweł
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styless.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplikacja LIGA PIŁKARSKA</title>
        </head>
    <body>
<%
    Connection conn1 = null;
    PreparedStatement preparedStatement = null;
    String user = request.getParameter("nazwa");    
    String pwd = request.getParameter("haslo");
    String path = getServletContext().getRealPath("/");
    Class.forName("org.sqlite.JDBC");
    conn1 = DriverManager.getConnection("jdbc:sqlite:" + path +"liga.db");
    String insertSQL = "insert into USERS(nazwa, haslo) values (?,?)";
                preparedStatement = conn1.prepareStatement(insertSQL);
                preparedStatement.setString(1, user);
                preparedStatement.setString(2, pwd);
    int rs = preparedStatement.executeUpdate();
    if (rs > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("witaj.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    conn1.close();
%>
</body>
</html>
