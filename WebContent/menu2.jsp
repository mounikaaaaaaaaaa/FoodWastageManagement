<html>
<!-- header -->
<div class="header-top">
	<div class="container">
		<div class="bottom_header_right">
			<div class="header-top-righ">
				<a href="logout.jsp"> <span class="fa fa-sign-out"
					aria-hidden="true"></span>Logout
				</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="header">
	<div class="content white">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#" target="_blank">
					 <a style="font-size:40px;color:black;">Food <b style="color: #06C167; font-size:40px;">Rescue Network</b></a>
					</a>
				</div>
				<!--/.navbar-header-->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1" align="right">
					<nav class="link-effect-2" id="link-effect-2" align="right">
						<ul class="nav navbar-nav">

							<%
								String role = (String) request.getSession().getAttribute("role");
								String username = (String) request.getSession().getAttribute( "username");
								
								System.out.println("Role:"+role);
								System.out.println("username:"+username);
		
								if (role.equals("admin")) {
							%>
									<li><a href="viewdonors.jsp">Users</a></li>
									<li><a href="viewmessages.jsp">Messages</a></li>
							<%
								}
							%>
							
							<%
								if (role.equals("donor")) {
							%>	
									<li><a href="addfood.jsp">Add Food</a></li>
									<li><a href="viewfood.jsp">Food</a></li>
									<li><a href="viewmessages.jsp">Messages</a></li>
							<%
								}
							%>
		
							<%
								if (role.equals("orphanage")) {
							%>	
									<li><a href="viewagents.jsp">Agents</a></li>
									<li><a href="viewmessages.jsp">Messages</a></li>
							<%
								}
							%>
							
							<%
								if (role.equals("agent")) {
							%>	
									<li><a href="viewfood.jsp">Food</a></li>
									<li><a href="viewmessages.jsp">Messages</a></li>
							<%
								}
							%>

						</ul>
					</nav>
				</div>
				<!--/.navbar-collapse-->
				<!--/.navbar-->
			</div>
		</nav>
	</div>
</div>