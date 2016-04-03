<%-- 
    Document   : header
    Created on : May 24, 2015, 2:12:48 PM
    Author     : adina.pirjol
--%>

<%@page import="java.util.List"%>
<%@page import="Entities.Category"%>
<%@page import="Entities.Customer"%>
<!-- partea de sus (logo + search bar + etc) -->
<a href="index.jsp">
    <img alt="logo" src="img/logo.jpg">
</a>
<div class="navbar-form navbar-right">
    
    <div class="input-group">
        <input type="Search" placeholder="Search..." class="form-control" />
        <div class="input-group-btn">
            <button class="btn btn-info">
                <span class="glyphicon glyphicon-search"></span>
            </button>
        </div>

    </div>
    <br></br>
    <p style="font-size: 20px">Shopping cart
        <a href="ShoppingCart.jsp" target="_blank" class="glyphicon glyphicon-shopping-cart"></a>
    </p>
</div>

<!-- menubar with buttons-->

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>

                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Events<b class="caret"></b></a>
                    <ul class="dropdown-menu" >
                        <% List<Category> categories = (List<Category>) request.getServletContext().getAttribute("categories");
                        for(Category c:categories) { %>
                            <li><a href="Category?categoryId=<%=c.getId()%>"><%=c.getName()%></a></li>
                        <% } %>
                    </ul>
                </li>

                <li><a href="Contact.jsp">Contact</a></li>
                <li><a href="SubmitEvent.jsp">Submit Event</a></li>
                <li><a href="test">Test</a></li>
            </ul>
            
            
            <ul class="nav navbar-nav navbar-right">
                <% if(request.getSession().getAttribute("customer") != null){ %>
                    <li><a href="Account.jsp"><span class="glyphicon glyphicon-log-in"></span>My Account</a></li>
                <% } else { %>
                    <li><a href="Register.jsp"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                    <li><a href="Register.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
