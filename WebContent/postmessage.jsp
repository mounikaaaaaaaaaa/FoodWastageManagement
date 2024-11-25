<!DOCTYPE HTML>
<%@page import="java.util.Date"%>
<html>
<head>
    <style>
        /* Add the background image to the main container */
        .register-form-main {
            background-image: url('https://www.classy.org/wp-content/uploads/2022/03/giving-quotes.jpeg'); /* Replace with your image URL */
            background-size: cover; /* Cover the entire container */
            background-repeat: no-repeat; /* Do not repeat the image */
            background-position: center; /* Center the image */
            padding: 20px; /* Add padding for better spacing */
            color: white; /* Set text color to white for better visibility */
        }

        /* Additional styles for form elements */
        .login-form {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white for better readability */
            border-radius: 8px; /* Round edges of the form */
            padding: 20px; /* Add padding around the form */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); /* Add shadow for depth */
        }

        /* Optional: Style the title */
        .title-div h3 {
            color: purple; /* Color for title */
            text-align: center; /* Center the title */
        }
    </style>
    <%@include file="header.html"%>
</head>
<body>
    <%@include file="menu2.jsp"%>
    <div class="register-form-main">
        <div class="container">
            <div class="title-div">
                <h3 class="tittle">
                    
                </h3>
                <div align="center">    
                    <%
                        String status = request.getParameter("status");
                        if (status != null) {
                    %>
                        <h1></h1>
                        <p style="color: red; size: 50px;"><%=status%></p>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="login-form">
                <form name="form" action="VoidmainServlet" method="post">
                    <input type="hidden" name="type" value="com.voidmain.pojo.Message">
                    <input type="hidden" name="redirect" value="viewmessages.jsp">
                    <input type="hidden" name="operation" value="add"> 
                    <input type="hidden" name="postedby" value="<%=username%>"> 
                    <input type="hidden" name="postedto" value="<%=request.getParameter("postedto")%>"> 
                    <input type="hidden" name="mdate" value="<%=new Date().toString()%>">
                
                    <div class="">
                        <p>Enter Message</p>
                        <textarea class="name" required name="message" rows="5" cols="70"></textarea>
                    </div>
                    
                    <br />
                    <input type="submit" value="Send Message" style="background-color: teal; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer; width: 100%; font-size: 16px;"> 
                </form>
            </div>
        </div>
    </div>
    <%@include file="footer.html"%>
</body>
</html>
