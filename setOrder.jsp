<%-- 
    Document   : setOrder
    Created on : 2019-okt-03, 21:41:12
    Author     : abel0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bo.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <%session.setAttribute("webhistory", request.getRequestURL().toString());%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if (session.getAttribute("userid") != null) {
            //session.removeAttribute("userid");
    %>

    <p style=" font-family: 'Roboto', sans-serif;
       line-height: 8;
       font-size:30px    ; 
       position:relative;
       left:190px;
       font-weight: 600;
       color: lightblue;
       -webkit-font-smoothing: antialiased;text-shadow: rgba(0,0,0,.01) 0 0 1px;">Thank you for your order! We will process it and send it to the giving address.</p>

    <%  LookItems look = new LookItems();
        if (session.getAttribute("shopCart") != null) {
            ArrayList<bo.Item> shopcart = (ArrayList<bo.Item>) session.getAttribute("shopCart");
            look.addONewOrder(shopcart, 1);
        }
    } else {%>
    <p style=" font-family: 'Roboto', sans-serif;
       line-height: 8;
       font-size:30px    ; 
       position:relative;
       left:190px;
       font-weight: 600;
       color: lightblue;
       -webkit-font-smoothing: antialiased;text-shadow: rgba(0,0,0,.01) 0 0 1px;">
        You have to log in first to check out!</p>

    <%
        response.sendRedirect("login.jsp");
    %>
    <% }%>
</html>
