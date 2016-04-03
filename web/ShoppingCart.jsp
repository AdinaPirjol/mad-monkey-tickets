<%-- 
    Document   : ShoppingCart
    Created on : May 27, 2015, 5:36:02 PM
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
        <title>Shoppinng Cart</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

        <%@include file="header.jsp" %>
        
        <div class="container">

            <h2>Shopping Cart</h2>
            
            <% ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
             
            if(request.getSession().getAttribute("shoppingCart") != null) {
                List<EventTicket> tickets = shoppingCart.getTickets(); %>
            
                <form class="form-horizontal" role="form" name="form" method="post" action="Purchase">
                    <div class="form-group">
                        <label class="col-xs-1 control-label">Payment method:</label>
                        <div class="col-xs-5">
                            <select class="form-control" name="payment">
                                <option value="paypal">Paypal</option>
                                <option value="cashondelivery">Cash on Delivery</option>
                                <option value="sms">Sms</option>
                            </select>
                        </div>
                    </div>

                    <h2>Tickets</h2>
                    
                    <% for(EventTicket t:tickets) { 
                        Event e = t.getEvent(); %>
                        <p><b><%=e.getName()%>, <%=e.getDateString()%></b></p>
                        <p><%=t.getTicketType()%>, <%=t.getPrice()%></p>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="ticket">Quantity</label>
                            <div class="col-sm-10">          
                                <input type="text" class="form-control" name="<%=t.getId()%>" placeholder="Quantity">
                            </div>
                        </div>
                    <% } %>

                    <div class="form-group">        
                      <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Purchase Tickets</button>
                      </div>
                    </div>
                </form>
            <% } else { %>
                <p>You have no items in your shopping cart. :(</p>
            <% } %>
            
        </div>
            
        <%@include file="footer.jsp" %>
    </body>
</html>

