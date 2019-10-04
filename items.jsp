<%-- 
    Document   : product
    Created on : 2019-okt-01, 16:45:37
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%session.setAttribute("webhistory", request.getRequestURL().toString());%>

    <%@page import="bo.*" %>
    <%@page import="java.util.ArrayList" %>

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
    <link rel="stylesheet"  href="product_responsive.css">

    <%        String itemId = null;
        LookItems look = new LookItems();
        Item item = null;
        if (request.getParameter("itemId") != null) {
            itemId = request.getParameter("itemId");
            item = look.searchItemById(Integer.parseInt(itemId));

        } else if (request.getParameter("addToCart") != null) {
            itemId = request.getParameter("addToCart");
            if (session.getAttribute("shopCart") != null) {
                item = look.searchItemById(Integer.parseInt(itemId));
                ArrayList<bo.Item> updateShopCart = (ArrayList<bo.Item>) session.getAttribute("shopCart");
                System.out.println("------------" + request.getParameter("Quantity"));
                updateShopCart.add(item);
                session.setAttribute("shopCart", updateShopCart);
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>

    <body>
        <!-- Top header -->
        <header class="w3-container w3-xlarge">
            <a href="index.jsp"> <p class="w3-left"><img src="<%=request.getContextPath()%>/img/logo.png"   class="logo2">
                </p></a>
            <div class="ex" style="position: relative; right: 100px">
                <a class="w3-right"href="cart.jsp " >
                    <i class="fa fa-shopping-cart w3-margin-right" style=" position: relative; 
                       top:30px;
                       right: 95px;
                       height:1em;
                       font-size: 2em; 
                       color: lightblue">
                    </i>
                </a>
                <a class="w3-right"href="login.jsp " >
                    <i class="fa fa-user-circle-o  w3-margin-right"style="position: relative; 
                       top:30px;
                       right:-70px;
                       height:1em;
                       font-size: 2em; 
                       color: lightblue;"></i>
                </a>
            </div>
        </header>
        <hr class="linje2">

        <div class="super_container">
            <div class="super_container_inner">
                <div class="super_overlay"></div>
                <div class="product">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6" >
                                <li>
                                    <img class="homepic" src="<%=request.getContextPath()%>/img/Fifa20.jpg">
                                </li>
                            </div>
                            <div class="col-lg-6 product_col">
                                <div class="product_info">
                                    <div class="product_name"><%= item.getItemName()%></div>
                                    <div class="product_rating_container d-flex flex-row align-items-center justify-content-start">
                                        <div class="rating_r rating_r_4 product_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                        <div class="product_reviews">4.7 out of (3514)</div>
                                    </div>
                                    <div class="product_price"><%= item.getItemPrice()%> kr</div>
                                    
                                    <div class="product_buttons" style="top: -5px">
                                        <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                            <div class="product_button">
                                                <div><p class="text" style="top: 10px"><font size="5"> <a href="#">Add to cart</a></font></p><div class="items" style="position: relative;right: 132px;top:-10px;"><i class="fa fa-shopping-cart" ></i></div></div>
                                                <form name="laptop" action="items.jsp" method="post">
                                                    <input type="submit" value="<%=item.getItemID()%>" name="addToCart" class="ivs2" />
                                                </form>

                                            </div>
                                            <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                <div><p class="text"><font size="5"><a href="checkout.jsp">Check out</a></font></p><div class="items"><i class="fa fa-shopping-bag"></i></div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>