<%-- 
    Document   : index
    Created on : May 18, 2015, 3:25:06 PM
    Author     : adina.pirjol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Plays</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>


        <div class="container">
            
            <%@include file="header.jsp" %>

            <h3>Upcoming plays</h3>

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="img-responsive center-block" src="img/play1.jpg" alt="play1">
                        <p align="center" style="font-size: 18px">Buy ticket
                                <a href="Tickets.jsp" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
                            </p>
                    </div>

                    <div class="item">
                        <img class="img-responsive center-block" src="img/play2.png" alt="play2">
                          <p align="center" style="font-size: 18px">Buy ticket
                                <a href="Tickets.jsp" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
                            </p>
                    </div>

                    <div class="item">
                        <img class="img-responsive center-block" src="img/play3.jpg" alt="play3">
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

    </body>
</html>
