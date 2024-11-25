<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.Food"%>
<html>
<head>
<%@include file="header.html"%>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('https://media.istockphoto.com/id/1413717270/photo/the-texture-of-a-white-wooden-board-empty-background.jpg?s=612x612&w=0&k=20&c=TUoXBTLZCSpAMpaw0ZdhxnCvDKJ5gN2AjZBCyUnhneg='); /* Replace with your background image URL */
        background-size: cover; /* Cover the entire viewport */
        background-attachment: fixed; /* Keep background fixed during scrolling */
        background-position: center; /* Center the background image */
        margin: 0;
        padding: 0;
        color: #333; /* Default text color */
    }

    h3.tittle a {
        color: purple;
        text-decoration: none;
    }

    table {
        font-family: Arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
        background-color: rgba(255, 255, 255, 0.8); /* Slightly transparent white background for readability */
    }

    th {
        background-color: red;
        color: white;
        border: 1px solid #dddddd;
        padding: 8px;
        text-align: left;
    }

    td {
        border: 1px solid #dddddd;
        padding: 8px;
        text-align: left;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    .register-form-main {
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background for form */
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        margin: 40px 0;
    }

    .container {
        width: 90%;
        margin: auto;
    }

    .title-div {
        text-align: center;
    }

    .tittle {
        font-size: 28px;
        margin-bottom: 10px;
        color: #333;
    }

    .action-links a {
        color: #007bff;
        text-decoration: none;
    }

    .action-links a:hover {
        text-decoration: underline;
    }

    .status-message {
        font-size: 20px;
        color: red;
    }

    .food-image {
        width: 100px;
        height: 100px;
        object-fit: cover;
    }

</style>
</head>
<body>
    <%@include file="menu2.jsp"%>
    
    <div class="container">
        <div class="title-div">
            <h3 class="tittle">
                <a>View Food</a>
            </h3>
            <div align="center">
                <!-- Optional: Display status messages if needed -->
            </div>
        </div>

        <%
            if (role.equals("donor")) {
        %>
        <table id="customers">
            <tr>
                <th>Name</th>
                <th>Prepared On</th>
                <th>Members Count</th>
                <th>Status</th>
                <th>Location</th>
                <th>Mobile</th>
                <th>Image</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                for (Food food : HibernateDAO.getFoods()) {
                    if (food.getPostedby().equals(username)) {
            %>
            <tr>
                <td><%=food.getName()%></td>
                <td><%=food.getPreparedtime()%></td>
                <td><%=food.getMembercount()%></td>
                <td><%=food.getStatus()%></td>
                <td><%=food.getLocation()%></td>
                <td><%=food.getMobile()%></td>
                <td><img src="./images/<%=food.getImage()%>" class="food-image" alt="Food Image"></td>
                <td class="action-links"><a href="updatefood.jsp?id=<%=food.getId()%>">update</a></td>
                <td class="action-links"><a href="viewfood.jsp?id=<%=food.getId()%>">delete</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <%
            } else if (role.equals("agent")) {
        %>
        <table id="customers">
            <tr>
                <th>Name</th>
                <th>Prepared On</th>
                <th>Members Count</th>
                <th>Status</th>
                <th>Location</th>
                <th>Mobile</th>
                <th>Image</th>
                <th>Send Message</th>
            </tr>
            <%
                for (Food food : HibernateDAO.getFoods()) {
            %>
            <tr>
                <td><%=food.getName()%></td>
                <td><%=food.getPreparedtime()%></td>
                <td><%=food.getMembercount()%></td>
                <td><%=food.getStatus()%></td>
                <td><%=food.getLocation()%></td>
                <td><%=food.getMobile()%></td>
                <td><img src="./images/<%=food.getImage()%>" class="food-image" alt="Food Image"></td>
                <td class="action-links"><a href="postmessage.jsp?postedto=<%=food.getPostedby()%>">send message</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>

        <%
            String id = request.getParameter("id");

            if (id != null) {
                if (HibernateTemplate.deleteObject(Food.class, Integer.parseInt(id)) == 1) {
                    response.sendRedirect("viewfood.jsp?status=success");
                } else {
                    response.sendRedirect("viewfood.jsp?status=failed");
                }
            }
        %>

    </div>
    <%@include file="footer.html"%>
</body>
</html>
