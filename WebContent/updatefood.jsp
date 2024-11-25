<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="org.hibernate.Hibernate"%>
<%@page import="com.voidmain.pojo.Food"%>
<%@page import="java.util.Date"%>
<html>
<head>
<%@include file="header.html"%>
</head>
<body>
	<%@include file="menu2.jsp"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>U</span>pdate <span>F</span>ood
				</h3>
				<div class="tittle-style" align="center">
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
				<form name="form" action="updatefood.jsp" name="appform">

					<input type="hidden" name="fid"
						value="<%=request.getParameter("id")%>">

					<div class="">
						<p>Member Count</p>
						<input type="text" class="name" name="membercount" required="required"/>
					</div>

					<br /> <input type="submit" value="Send Review">
				</form>
			</div>

			<%
				String fid = request.getParameter("fid");
				String membercount = request.getParameter("membercount");

				if (fid !=null  && membercount != null) {

					Food food = HibernateDAO.getFoodById(Integer.parseInt(fid));
					food.setMembercount(membercount);

					if (HibernateTemplate.updateObject(food) == 1) {
						response.sendRedirect("viewfood.jsp?status=success");
					} else {
						response.sendRedirect("viewfood.jsp?status=failed");
					}
				}
			%>

		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>