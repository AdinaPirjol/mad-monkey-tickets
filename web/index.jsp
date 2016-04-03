<%-- 
    Document   : index
    Created on : May 18, 2015, 1:17:02 PM
    Author     : adina.pirjol
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Event"%>
<%@page import="Entities.Event"%>
<%@page import="Entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" isELIgnored="false"%>
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
            
            <% if(request.getSession().getAttribute("customer") != null){
                Customer c = (Customer) request.getSession().getAttribute("customer"); %>
            <p>Hello, <%= c.getName() %></p>
            <%}%>

    <div class="row">
        <div class="col-sm-4">
        <!-- pg impartita in 3 coloane-->

            <h2>Upcoming Events</h2>
            
            <% if(request.getAttribute("newEvent") != null) { %>
                <p>Created new event id=<%=request.getParameter("newEvent")%>=</p>
            <% request.setAttribute("newEvent", null); } %>
            
            <ul class="list-unstyled">
                
                <% if(request.getServletContext().getAttribute("upcomingEvents") != null) { 
                    List<Event> events = (List<Event>) request.getServletContext().getAttribute("upcomingEvents"); 
                    for(Event e:events) { %>
                        <li><a href="Event?eventId=<%=e.getId()%>"><%=e.getName()%></a></li>
                        <li><p><%=e.getDateString()%> - <%=e.getLocation().getName()%>, <%=e.getLocation().getCity()%></p></li>         
                <% }} %>
                
            </ul>
        </div>
                
    <div class="col-sm-4">
        <div class="container">

            <div id="myCarousel" class="carousel slide" data-ride="carousel">

              <!-- Wrapper for slides -->
              <div class="carousel-inner">

                <div class="item active">
                  <img src="img/homeslide1.jpg" alt="homeslide1">
                   <div class="carousel-caption">
                  </div>
                </div><!-- End Item -->

                 <div class="item">
                  <img src="img/homeslide2.jpg" alt="homeslide2">
                   <div class="carousel-caption">
                  </div>
                </div><!-- End Item -->

                <div class="item">
                  <img src="img/homeslide3.jpg" alt="homeslide3">
                   <div class="carousel-caption">
                  </div>
                </div><!-- End Item -->

                <div class="item">
                  <img src="img/homeslide4.jpg" alt="homeslide4">
                   <div class="carousel-caption">
                  </div>
                </div><!-- End Item -->

                <ul class="nav nav-pills navbar-nav">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#"><img src="img/small_homeslide1.jpg"></img></a></li>
                  <li data-target="#myCarousel" data-slide-to="1"><a href="#"><img src="img/small_homeslide2.jpg"></a></li>
                  <li data-target="#myCarousel" data-slide-to="2"><a href="#"><img src="img/small_homeslide3.jpg"></a></li>
                  <li data-target="#myCarousel" data-slide-to="3"><a href="#"><img src="img/small_homeslide4.jpg"></a></li>
                </ul>
              </div><!-- End Carousel Inner -->

            </div><!-- End Carousel -->
        </div>
    </div>
                
                
                
            </div>
        </div>
                
                <%@include file="footer.jsp" %>

    </body>
</html>
