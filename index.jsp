<%-- 
    Document   : cart
    Created on : 2019-okt-01, 10:50:45
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login.css">
    <%@page import="bo.*" %>
    <%@page import="java.util.ArrayList" %>

    <%session.setAttribute("webhistory", request.getRequestURL().toString());%>

    <body class="w3-content">
        <!-- !PAGE CONTENT! -->
        <div class="w3-main" >
            <!-- Top header -->
            <header class="w3-container w3-xlarge">
                <a href="index.jsp"> <p class="w3-left"><img src="<%=request.getContextPath()%>/img/logo.png" class="logo" >
                    </p></a>
                <a class="w3-right" href="checkout.jsp " >
                    <i class="fa fa-shopping-cart w3-margin-right">
                    </i>
                </a>
                <a class="w3-right"href="login.jsp " >
                    <i class="fa fa-user-circle-o  w3-margin-right"></i>
                    </i>
                </a>
            </header>
            <hr class="linje" style="width: 1500px; left: -110px">


            <!-- Product grid -->
            <div style=" position:relative; left:150px; top:-50px;">

                <%

                    if (session.getAttribute("shopCart") == null) {
                        ArrayList<bo.Item> shopcart = new ArrayList();
                        session.setAttribute("shopCart", shopcart);
                    }
                    String group
                            = request.getParameter("itemGroup");
                    LookItems look = new LookItems();
                    ArrayList<Item> table
                            = look.getItemsWithGroup(group);
                    int size = table.size();
                %>

                <%
                    for (int i = 0; i < size; i++) {
                        Item a = table.get(i);
                %>
                <div class="w3-col l4 s6" style=" position:relative; right: 165px;">
                    <div class="w3-container" >
                        <form name="product" action="items.jsp" method="post">
                            <img  class="homepic" src="<%=request.getContextPath()%>/img/Fifa20.jpg" style="position:relative; height: 250px; width: 390px;">
                            <input type="submit" value="<%= a.getItemID()%>" name="itemId" class="indexbutton" />
                        </form>

                        <center><b><%= a.getItemName()%></b><br><%= a.getItemPrice()%></center>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
    </body>
</html>
