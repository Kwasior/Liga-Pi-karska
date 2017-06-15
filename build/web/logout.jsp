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
session.setAttribute("user", null);
session.setAttribute("role", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>
