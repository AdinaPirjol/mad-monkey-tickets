<%-- 
    Document   : Category
    Created on : May 27, 2015, 2:24:38 PM
    Author     : adina.pirjol
--%>

<%@page import="Entities.Event"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Movies</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>


        <div class="container">

            <%@include file="header.jsp" %>

            <% Category c = (Category) request.getAttribute("category");
            List<Event> events = c.getEvents();
            String[] categoryImages = (String[]) request.getAttribute("categoryImages");
            %>
            
            <h3>Upcoming <%=c.getName()%></h3>
            <p><%=c.getDescription()%></p><br>

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    
                    <% for (int i = 1; i < events.size()-1; i++) { %>
                        <li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
                    <% } %>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <% for(Event e:events) { %>
                        <div class="item active">
                            <a href="Event?eventId=<%=e.getId()%>">
                                <img class="img-responsive center-block" src="img/<%=c.getName()%>/<%=e.getId()%>.jpg" alt="Cell">
                            </a>
                        <p align="center" style="font-size: 18px">Buy ticket
                            <a href="Event?eventId=<%=e.getId()%>" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
                        </p>
                    </div>
                    <% } %>
                    
                    
                    <div class="item active">
                        <img class="img-responsive center-block" src="img/movie1.jpg" alt="Cell">
                        <p align="center" style="font-size: 18px">Buy ticket
                            <a href="Tickets.jsp" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
                        </p>
                    </div>

                    <div class="item">
                        <img class="img-responsive center-block" src="img/movie2.jpg" alt="Star Wars">
                     <p align="center" style="font-size: 18px">Buy ticket
                                <a href="Tickets.jsp" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
                            </p>
                    </div>

                    <div class="item">
                        <img class="img-responsive center-block" src="img/movie3.jpg" alt="Jurassic World">
                       <p align="center" style="font-size: 18px">Buy ticket
                                <a href="Tickets.jsp" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
                            </p>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>

            </div>
        </div>

    <%@include file="footer.jsp" %>
    
    </body>
</html>

