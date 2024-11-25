<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.User"%>
<html>
<head>
<%@include file="header.html"%>
    <style>
        .welcome-message {
            background-color: #e0f7fa; /* Light background color */
            color: #333; /* Text color */
            padding: 15px; /* Padding around the message */
            border-radius: 8px; /* Rounded corners */
            margin-bottom: 20px; /* Space below the message */
            opacity: 0; /* Initially hidden */
            transform: translateY(-20px); /* Slide in effect */
            transition: opacity 0.5s ease-out, transform 0.5s ease-out; /* Transition for smooth effect */
        }
        .welcome-message.show {
            opacity: 1; /* Fully visible */
            transform: translateY(0); /* Reset position */
        }
body{
       background-image: url('https://media.istockphoto.com/id/1413717270/photo/the-texture-of-a-white-wooden-board-empty-background.jpg?s=612x612&w=0&k=20&c=TUoXBTLZCSpAMpaw0ZdhxnCvDKJ5gN2AjZBCyUnhneg=');
}
    </style>
    <script>
        // Function to show the welcome message with a transition effect
        function showWelcomeMessage() {
            const message = document.querySelector('.welcome-message');
            message.classList.add('show');
        }
        
        // Call the function after the page loads
        window.onload = function() {
            showWelcomeMessage();
        };
    </script>
</head>
<body>
	<%@include file="menu2.jsp"%>
	<div class="register-form-main">
		<div class="container">
            <!-- Welcome message at the top -->
            <div class="welcome-message">
                <a styel="font-size:35px;">Hello Admin, welcome back!</h2>
            </div>

			<div class="title-div">
				<h3 class="tittle">
					View All Accounts
				</h3>
			</div>

			<!-- Table to display users (Donors, Agents, Orphanages) -->
			<table id="customers">
				<tr>
					<th>User Name</th>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Address</th>
					<th>User Type</th> <!-- Added column to display the user type -->
					<th>Send Message</th>
					<th>Delete</th>
				</tr>

				<%
					// Loop through all users and display different types (Donors, Agents, Orphanages)
					for (User user : HibernateDAO.getUsers()) {
						if(user.getUsertype().equals("donor") || user.getUsertype().equals("agent") || user.getUsertype().equals("orphanage")) {
				%>
							<tr>
								<td><%=user.getUsername()%></td>
								<td><%=user.getName()%></td>
								<td><%=user.getEmail()%></td>
								<td><%=user.getMobile()%></td>
								<td><%=user.getAddress()%></td>
								<td><%=user.getUsertype()%></td> <!-- Display user type (Donor, Agent, Orphanage) -->
								<td><a href="postmessage.jsp?postedto=<%=user.getUsername()%>">Send Message</a></td>
								<td><a href="viewdonors.jsp?id=<%=user.getUsername()%>">Delete</a></td>
							</tr>
				<%
						}
					}
				%>
			</table>

			<!-- Delete functionality -->
			<%
				String id = request.getParameter("id");
				if (id != null) {
					if (HibernateTemplate.deleteObject(User.class, id) == 1) {
						HibernateTemplate.deleteObject(Login.class, id); // Deleting user login credentials
						response.sendRedirect("viewdonors.jsp?status=success");
					} else {
						response.sendRedirect("viewdonors.jsp?status=failed");
					}
				}
			%>

		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>
