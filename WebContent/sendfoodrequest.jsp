<!DOCTYPE HTML>
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
					<span>S</span>end <span>F</span>ood Request
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
				
				<form name="form" action="VoidmainServlet" method="post" name="appform" enctype="multipart/form-data">
					
					<input type="hidden" value="Available" name="status">
					<input type="hidden" value="<%=username%>" name="postedby">
					
					 <div class="">
						<p>Food Name</p>
						<input type="text" class="name" name="name" required="required"/>
					</div>
					<br />
					
					<div class="">
						<p>Select Food Image</p>
						<input type="file" class="name" name="image" required="required"/>
					</div>
					<br />
					
					<div class="">
						<p>Prepared Time</p>
						<input type="text" class="name" name="preparedtime" required="required"/>
					</div>
					<br />
					
					<div class="">
						<p>Member Count</p>
						<input type="text" class="name" name="membercount" required="required"/>
					</div>
					<br />
					
					<div class="">
						<p>Location</p>
						<input type="text" class="name" name="location" required="required"/>
					</div>
					<br />
					
					<div class="">
						<p>Mobile</p>
						<input type="text" class="name" name="mobile" required="required"/>
					</div>
					<br />
					<input type="submit" value="Add Food">
					
				</form>
				
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>