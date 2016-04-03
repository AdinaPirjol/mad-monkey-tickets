<%-- 
    Document   : ThankYou
    Created on : May 27, 2015, 6:23:35 PM
    Author     : adina.pirjol
--%>

<%@page import="Entities.EventTicket"%>
<%@page import="Entities.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Event"%>
<%@page import="Entities.Event"%>
<%@page import="Entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Purchase Complete</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

        <%@include file="header.jsp" %>
        
        <div class="container">

            <h2>Purchase Completed</h2>
            
            <% boolean success = (boolean) request.getSession().getAttribute("success");
             
            if(success) { %>
                <p>Thank you for your order!</p>
            <% } else { %>
                <p>Purchase couldn't be completed. The shopping cart was empty or there was an error processing it.</p>
            <% } %>
            
            <a href="index.jsp">Get back</a>
        </div>
            
        <%@include file="footer.jsp" %>
    </body>
</html>

