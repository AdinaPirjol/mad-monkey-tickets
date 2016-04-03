<%-- 
    Document   : Event
    Created on : May 24, 2015, 11:16:39 PM
    Author     : adina.pirjol
--%>

<%@page import="Entities.EventTicket"%>
<%@page import="Entities.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Event</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom CSS -->
        <link href="css/shop-item.css" rel="stylesheet">
    </head>
    <body>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>



        <div class="container">
            
            <%@include file="header.jsp" %>
            
            <% Event event = (Event) request.getAttribute("event"); %>
            
        </div>   
         <!-- Page Content -->
    <div class="container">

        <div class="row" id="mymenu">

            <div class="col-md-3">
                <p class="lead"><%=event.getName()%></p>
                <div class="list-group">
                    <a href="#" class="list-group-item active"><%=event.getCategory().getName()%></a>
                </div>
            </div>
            
            
            <div class="col-md-9" >

                <div class="thumbnail">
                    <img class="img-responsive" src="img/<%=event.getCategory().getName()%>/<%=event.getId()%>.jpg" alt="">
                    <div class="caption-full">
                        <% for(EventTicket ticket : event.getEventTickets()) { %>
                        <a href="Tickets?ticketId=<%=ticket.getId()%>">
                            <h4 class="pull-right">$<%=ticket.getPrice()%>, <%=ticket.getTicketType().toString()%></h4>
                        </a>
                        <% } %>
                        <h4>
                            <a href="#"><%=event.getName()%></a>
                        </h4>
                        <p><i><%=event.getLocation().getName()%>, <%=event.getLocation().getCity()%> (<%=event.getLocation().getAddress()%>)</i></p>
                        <p><i><%=event.getShortDescription()%></i></p>
                        <p><%=event.getDescription()%></p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>

                <div class="well">

                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">10 days ago</span>
                            <p>This was great. I would definitely go again!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">12 days ago</span>
                            <p>I've never missed this event!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">15 days ago</span>
                            <p>I've been to better events, but not at this price. I definitely recommend going next time.</p>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

    <%@include file="footer.jsp" %>
        
    </body>
</html>