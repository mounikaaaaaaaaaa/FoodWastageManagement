<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.User"%>
<html>
<head>
    <%@include file="header.html"%>
    <style>
        body {
       background-image: url('https://media.istockphoto.com/id/1413717270/photo/the-texture-of-a-white-wooden-board-empty-background.jpg?s=612x612&w=0&k=20&c=TUoXBTLZCSpAMpaw0ZdhxnCvDKJ5gN2AjZBCyUnhneg=');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-color: #f0f0f0; /* Fallback color */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }
        
        .register-form-main {
            padding: 20px; /* Add some padding for better visibility */
        }
    </style>
</head>
<body>
    <%@include file="menu2.jsp"%>
    <div class="register-form-main">
        <div class="container">
            <div class="title-div">
                <h3 class="tittle">
                    View Agents
                </h3>
                <div  align="center">
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

            <table id="customers">
                <tr>
                    <th>User Name</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>Send Request</th>
                </tr>
                <%
                    for (User user : HibernateDAO.getUsers()) {
                        if(user.getUsertype().equals("agent")) {
                %>
                            <tr>
                                <td><%=user.getUsername()%></td>
                                <td><%=user.getName()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=user.getMobile()%></td>
                                <td><%=user.getAddress()%></td>
                                <td><a href="postmessage.jsp?postedto=<%=user.getUsername()%>">send request</a></td>
                            </tr>
                 <%
                        }
                    }
                %>
            </table>

            <%
                String id = request.getParameter("id");
                if (id != null) {
                    if (HibernateTemplate.deleteObject(User.class, id) == 1) {
                        HibernateTemplate.deleteObject(Login.class, id);
                        response.sendRedirect("viewagents.jsp?status=success");
                    } else {
                        response.sendRedirect("viewagents.jsp?status=failed");
                    }
                }
            %>

        </div> <!-- End of container -->
    </div> <!-- End of register-form-main -->
    	<%@include file="footer.html"%>
</body>
</html>
                
