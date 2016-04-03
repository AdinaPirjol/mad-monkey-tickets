<%-- 
    Document   : Account
    Created on : May 25, 2015, 12:02:52 PM
    Author     : adina.pirjol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Homepage</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>


        <div class="container">

            <%@include file="header.jsp" %>

            <div class="row">
                <div class="col-sm-4">
                <!-- pg impartita in 3 coloane-->

                    <h2>Mockup Account</h2>

                    <ul class="list-unstyled">
                        
                        <% if(request.getSession().getAttribute("customer") != null){
                            Customer c = (Customer) request.getSession().getAttribute("customer"); %>
                            <li>Hello, <%= c.getName() %></li>
                            <li><%= c.getName() %></li>
                            <li><%= c.getEmail() %></li>
                            <li><%= c.getPhoneNumber() %></li>
                            <li><%= c.getCity() %></li>
                            <li><%= c.getFacebookId() %></li>
                        <%}%>

                    </ul>
                </div>
            </div>
    <%@include file="footer.jsp" %>
    
    </body>
</html>

