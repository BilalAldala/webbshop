<%-- 
    Document   : checkout
    Created on : 2019-okt-03, 16:46:19
    Author     : abel0
--%>

<%@page import="bo.*"%>
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
                ArrayList<ShopCart> shopCart2 = (ArrayList<ShopCart>) session.getAttribute("shopCart");
                ArrayList<Customer> shopCart3 = (ArrayList<Customer>) session.getAttribute("shopCart");

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
                                            <li class="mr-auto">ShopCartID</li>
                                            <li class="mr-auto">OrderDate</li>
                                            <li class="mr-auto">CAddress</li>
                                            <li class="mr-auto">CMail</li>
                                            <li class="mr-auto">ItemID</li>
                                            <li class="mr-auto">ItemName</li>
                                            <li class="mr-auto">Quantity</li>

                                        </ul>
                                    </div>
                                    <% for (int i = 0; i < sizeOfShopCart; i++) {
                                            Item item = shopCart.get(i);
                                            ShopCart sh = shopCart2.get(i);
                                            Customer c = shopCart3.get(i);
                                    %>
                                    <div>
                                        <li class="cart_item item_list d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-end justify-content-start">
                                            <p style="position: relative; right: 500px"><%= sh.getShopCartID()%></p>
                                            <p style="position: relative; right: 430px"><%= sh.getOrderDate()%></p>
                                            <p style="position: relative; right: 370px"><%= c.getCAddress()%></p>
                                            <p style="position: relative; right: 310px"><%= c.getCMail()%></p>
                                            <p style="position: relative; right: 220px"><%= item.getItemID()%></p>
                                            <p style="position: relative; right: 130px"><%= item.getItemName()%></p>
                                            <p style="position: relative; right: 70px;top:-7px"><%= item.getItemQuantity()%></p>
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
        <p style="line-height:8;
           font-size:30px; 
           position:relative;
           left:540px;
           font-weight: 600;
           color: lightblue;
           -webkit-font-smoothing: antialiased;text-shadow: rgba(0,0,0,.01) 0 0 1px;">
            No Product is added</p>
            <%}%>

    </body>
</html>