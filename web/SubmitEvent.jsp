<%-- 
    Document   : SubmitEvent
    Created on : May 25, 2015, 3:17:08 AM
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
        <title>Submit New Event</title>
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
        <script src="js/category-name.js"></script>

        <div class="container">

            <%@include file="header.jsp" %>
            
            <div class="container">
            <h2>Event Details</h2>
            <form class="form-horizontal" role="form" name="form" method="post" action="submitEvent">
                <div class="form-group">
                  <label class="control-label col-sm-2" for="event-name">Name:</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="event-name" placeholder="Desired display event name">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-2" for="event-short-description">Short Description:</label>
                  <div class="col-sm-5">          
                    <input type="text" class="form-control" name="event-short-description">
                  </div>
                </div>
            
                <div class="form-group">
                  <label class="control-label col-sm-2" for="event-description">Description:</label>
                  <textarea class="form-control" rows=5 name="event-description"></textarea>
                </div>

                <div class="form-group">
                <label class="control-label col-sm-2" for="event-startdate">Start Date:</label>
                <div class="col-sm-10">          
                  <input type="text" class="control-label col-sm-2 " name="event-startdate" style="margin-bottom:14px;">
                  <script type="text/javascript">
                        $(window).load(function ()
                        {
                            $('#event-startdate').glDatePicker();
                        });
                    </script>
                </div>

                <div class="form-group">
                <label class="control-label col-sm-2" for="event-enddate">End Date:</label>
                <div class="col-sm-10">          
                    <input type="text" class="control-label col-sm-2" name="event-enddate">
                    <script type="text/javascript">
                        $(window).load(function ()
                        {
                            $('#event-enddate').glDatePicker();
                        });
                    </script>
                </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-2" for="event-image">Event Poster:</label>
                  <div class="col-sm-5">
                    <input type="file" class="form-control" name="event-image" >
                  </div>
                </div>
                
              
                <h3>Location</h3>
                <div class="form-group">
                  <label class="control-label col-sm-2" for="location-name">Location Name:</label>
                  <div class="col-sm-10">          
                    <input type="text" class="form-control" name="location-name">
                  </div>
                </div>
            
                <div class="form-group">
                  <label class="control-label col-sm-2" for="location-city">City:</label>
                  <div class="col-sm-10">          
                    <input type="text" class="form-control" name="location-city">
                  </div>
                </div>
            
                <div class="form-group">
                  <label class="control-label col-sm-2" for="location-address">Address:</label>
                  <div class="col-sm-10">          
                    <input type="text" class="form-control" name="location-address">
                  </div>
                </div>

                <h3>Category</h3>
                
                <div class="form-group">
                  <label class="control-label col-sm-2" for="category-name">Category Name:</label>
                  <div class="col-sm-10">          
                    <input type="text" class="form-control" name="category-name">
                  </div>
                </div>

                </div>
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Submit</button>
                  </div>
                </div>
            </form>
          </div>
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>