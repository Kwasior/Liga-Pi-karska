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
        <title>Logowanie</title>
        </head>
    <body link="white" vlink="white" alink="green">
<div id="strona">
<form method="post" action="login.jsp">
            <center>
            <table border="0" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Logowanie</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nazwa użytkownika</td>
                        <td><input type="text" name="nazwa" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Hasło</td>
                        <td><input type="password" name="haslo" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Zaloguj się" />
                        <input type="reset" value="Resetuj" />
                        </td>
                    </tr>                    
                </tbody>
            </table>
            </center>
</form></br>
    <center>Nie jesteś zarejestrowany? <a href="reg.jsp">Zarejestruj się teraz</a></center>
</div>
</body>
</html>
