<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Message"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<html>
<head>
<%@include file="header.html"%>
<style>
body{
       background-image: url('https://media.istockphoto.com/id/1413717270/photo/the-texture-of-a-white-wooden-board-empty-background.jpg?s=612x612&w=0&k=20&c=TUoXBTLZCSpAMpaw0ZdhxnCvDKJ5gN2AjZBCyUnhneg=');
}
</style>
</head>
<body>
	<%@include file="menu2.jsp"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<a style="color:purple">View Messages</a>
				</h3>
			</div>

			<%
				String status = request.getParameter("status");

				if (status != null) {
			%>
			<h1><%=status%></h1>
			<%
				}
			%>

			<table id="customers">
				<tr>
					<th>Message</th>
					<th>Posted By</th>
					<th>Date</th>
					<th>Reply</th>
					<th>Delete</th>
				</tr>

				<%
					for (Message message : HibernateDAO.getMessages()) {
						
						if (message.getPostedto().equals(username)) {
				%>
							<tr>
								<td><%=message.getMessage()%></td>
								<td><%=message.getPostedby()%></td>
								<td><%=message.getMdate()%></td>
								<td><a
									href="postmessage.jsp?postedto=<%=message.getPostedby()%>">reply</a></td>
								<td><a href="viewmessages.jsp?mid=<%=message.getId()%>">delete</a></td>
							</tr>
				<%
						}
					}
				%>

			</table>

			<%
				String mid = request.getParameter("mid");

				if (mid != null) {

					if (HibernateTemplate.deleteObject(Message.class, Integer.parseInt(mid)) == 1) {
						response.sendRedirect("viewmessages.jsp?status=success");
					} else {
						response.sendRedirect("viewmessages.jsp?status=failed");
					}
				}
			%>


		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>