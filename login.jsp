<!DOCTYPE html>

<html>
        <%@page import="bo.*" %>

    <%if(session.getAttribute("userid")!=null){%>
                <%response.sendRedirect("index.jsp");%>

    <%}else{%>
    <%
        String username = request.getParameter("uname");
        String pwd = request.getParameter("pass");
        LookItems l=new LookItems();
        if (pwd != null && username != null && l.login(username, pwd)) {
            session.setAttribute("userid", username);
            String url = (String) session.getAttribute("webhistory");
            response.sendRedirect(url);
        } else {%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"  href="util.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="main.css">

    <body class="w3-content">
        <%-- 
        
<%@page import="db.*" %>
        <%
            String userid = request.getParameter("uname");
            String pwd = request.getParameter("pass");
            if (pwd != null && userid != null && ItemDB.loginAsEMP(userid, pwd)) {

                session.setAttribute("userid", userid);%>
        Logged in as <%= userid%>
        <% } else {%>
        --%>

        <header class="w3-container w3-xlarge">
            <a href="index.jsp"> <p class="w3-left"><img src="<%=request.getContextPath()%>/img/logo.png" style="width:200px;
                                                         height:100px;
                                                         position: relative; 
                                                         left:-180px; 
                                                         top:5px" >
                </p></a>
            <a class="w3-right" href="checkout.jsp " >
                <i class="fa fa-shopping-cart w3-margin-right" style=" position: relative; 
                   top:30px;
                   left: 195px;
                   height:1em;
                   font-size: 3.8em; 
                   color: lightblue">
                </i>
            </a>
        </header>
        <hr style="position: relative;
            top:-10px; 
            left:-220px; 
            border-top: 2px solid lightblue;
            width: 1520px;">

        <div class="container-login100">
            <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33" style=" position: relative;top:-98px">
                <img src="<%=request.getContextPath()%>/img/logo.png"  class="logo" style="position: relative;left: 110px">

                <form class="login100-form validate-form flex-sb flex-w" action="login.jsp">
                    <span>
                        Username
                    </span>
                    <div class="wrap-input100">
                        <input class="input100" type="text" name="uname" value=""/>
                    </div>
                    <span style="position:relative;top:10px">
                        Password
                    </span>
                    <div class="wrap-input100" style="top:10px">
                        <input class="input100" type="password" name="pass" value=""/>
                    </div>

                    <div class="container-login100-form-btn m-t-17">
                        <input class="login100-form-btn" type="submit" value="Login"/>
                    </div>
                </form>
            </div>
        </div>
    </body>

    <% }}%>
</html>