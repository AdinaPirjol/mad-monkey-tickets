<%-- 
    Document   : index
    Created on : May 18, 2015, 3:25:06 PM
    Author     : adina.pirjol
--%>

<%@page import="Entities.Event"%>
<%@page import="Entities.EventTicket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Tickets</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="jquery/glDatePicker/styles/glDatePicker.default.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="jquery/glDatePicker/glDatePicker.min.js"></script>


        <div class="container">

            <%@include file="header.jsp" %>
            <% EventTicket ticket = (EventTicket) request.getAttribute("ticket"); 
            Event event = ticket.getEvent(); %>
            
            <h2>Ticket for <b><%=event.getName()%>, <%=event.getDateString()%></b></h2>
            
            <form class="form-horizontal" role="form" name="form" method="post" action="addToShoppingCart">
                <div class="checkbox">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="ticket"><%=ticket.getTicketType().toString()%>, $<%=ticket.getPrice()%></label>
                        <div class="col-sm-10">          
                          <input type="checkbox" name="ticket" value="<%=ticket.getId()%>">
                        </div>
                    </div>
                </div>
                
                <p>Other tickets for same event:</p>
                
                <% for(EventTicket t:event.getEventTickets()) { 
                    if(t.getTicketType() != ticket.getTicketType()) {%>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="ticket"><%=ticket.getTicketType().toString()%>, $<%=ticket.getPrice()%></label>
                            <div class="col-sm-10">          
                              <input type="checkbox" name="ticket" value="<%=ticket.getId()%>">
                            </div>
                        </div>
                <% }} %>
                
                </div>
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Add to Shopping Cart</button>
                  </div>
                </div>
            </form>
            
            ticket.get
            
        </div>

        <%@include file="footer.jsp" %>
        
    </body>
</html>
