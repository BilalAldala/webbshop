<%-- 
    Document   : checkout
    Created on : 2019-okt-03, 16:46:19
    Author     : abel0
--%>

<%@page import="bo.Item"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <%session.setAttribute("webhistory", request.getRequestURL().toString());%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Little Closet template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-4.1.2/bootstrap.min.css">
    <link rel="stylesheet"href="product.css">
    <link rel="stylesheet"href="cart.css">
    <body>
        <!-- Top header -->
        <header class="w3-container w3-xlarge">
            <a href="index.jsp"> <p class="w3-left"><img src="<%=request.getContextPath()%>/img/logo.png"   class="logo2">
                </p></a>
            <div class="ex" style="position: relative; right: 100px">

                <a class="w3-right"href="login.jsp " >
                    <i class="fa fa-user-circle-o  w3-margin-right"style="position: relative; 
                       top:30px;
                       left:80px;
                       height:1em;
                       font-size: 2em; 
                       color: lightblue;"></i>
                </a>
            </div>
        </header>
        <hr class="linje2">
        <%if (session.getAttribute("shopCart") != null) {

                ArrayList<Item> shopCart = (ArrayList<Item>) session.getAttribute("shopCart");
                int sizeOfShopCart = shopCart.size();

        %>

        <div class="super_container">
            <div class="super_container_inner">
                <div class="super_overlay"></div>
                <div class="cart_section">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="cart_container" style="width: 85%;  position: relative; left: 50px">
                                    <div class="cart_bar">
                                        <ul class="cart_bar_list item_list d-flex flex-row align-items-center justify-content-end">
                                            <li class="mr-auto" style="position: relative;left: 300px">Product</li>
                                            <li style="position: relative; right: 35px">Price</li>
                                            <li>Remove</li>
                                        </ul>
                                    </div>


                                    <% for (int i = 0; i < sizeOfShopCart; i++) {
                                            Item item = shopCart.get(i);
                                    %>
                                    <div>
                                        <li class="cart_item item_list d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-end justify-content-start">
                                            <img src="<%=request.getContextPath()%>/img/Fifa20.jpg" style="width: 187px; height:127px; position: relative; right:654px">
                                            <p style="position: relative; right: 540px"><%= item.getItemName()%></p>
                                            <p style="position: relative; right: 140px"><%= item.getItemPrice()%></p>
                                            <p style="position: relative; right: 25px;top:-7px"><i class="fa fa-trash-o" style="font-size:25px"></i></p>
                                            <input type="submit" value="<%=item.getItemID()%>" name="removeFromCart" style="position: relative;
                                                   right: 47px;
                                                   top:-8px;
                                                   width: 25px;
                                                   background-color: transparent;
                                                   cursor: pointer;
                                                   border-color: transparent;
                                                   text-indent: -9000px; 
                                                   text-transform: capitalize
                                                   "/>

                                        </li>
                                    </div>


                                    <% }%>
                                    <!-- Cart Buttons -->
                                    <div class="cart_buttons d-flex flex-row align-items-start justify-content-start">
                                        <div class="cart_buttons_inner ml-sm-auto d-flex flex-row align-items-start justify-content-start flex-wrap">
                                            <div class="button button_continue trans_200"><a href="setOrder.jsp">Confirm order</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} else { %>

        toomt

        <%}%>
    </body>
</html>