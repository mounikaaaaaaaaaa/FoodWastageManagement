<!DOCTYPE HTML>
<html>
<head>
	<%@include file="header.html"%>
	<style>
		.register-form-main {
			background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK5Kj7-VqjqxD63WhczB3oMs-1pS8E5ZzkGXaImd-o0XucffMCyMI7dkzhIEgPOQV9eiY&usqp=CAU');
			padding: 20px; /* Optional: Add padding for better visual spacing */
			background-repeat: no-repeat; /* Prevent background image repetition */
			background-size: cover; /* Ensure the background covers the container */
			background-position: center; /* Center the background image */
		}
		.login-form {
			background-color: white;
			padding: 20px;
			border-radius: 10px; /* Optional: Rounded corners for a smoother look */
			box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Optional: Add a subtle shadow for depth */
		}
		
	</style>
</head>
<body>
	<%@include file="menu1.html"%>
	<div class="register-form-main">
		<div class="container">
			<div class="title-div">
    			<h3 class="tittle" style="color: black;">
        			<a style="font-family:sans-serif;color:black;">Registration</a>
    			</h3>
    			<div align="center">    
        			<%
            			String status = request.getParameter("status");

            			if (status != null) {
        			%>
                			<h1></h1>
                			<p style="color: red; font-size: 50px;"><%=status%></p> <!-- Kept red for status message -->
        			<%
            			} else {
        			%>
                			<p style="color: white; font-size: 20px;font-family: 'Arial', sans-serif;font-weight: bold;">

Sign up to become a part of the Food Rescue Network today!</p> <!-- Light gray color for visibility -->
        			<%
            			}
        			%>
    			</div>
			</div>

			<div class="login-form">
				<form name="form" action="VoidmainServlet" method="post" name="appform">
				
					<input type="hidden" name="type" value="com.voidmain.pojo.User">
					<input type="hidden" name="operation" value="add"> 
					<input type="hidden" name="redirect" value="registration.jsp">
					
                    <div class="">
						<p>User Name</p>
						<input type="text" class="name" placeholder="Enter user name" name="username" required="required"/>
					</div>

					<div class="">
						<p>Password</p>
						<input type="password" class="name" placeholder="Enter user password" name="password"  required>
					</div>
					
					 <div class="">
						<p>Name</p>
						<input type="text" class="name" placeholder="Enter your name" name="name" required="required"/>
					</div>
					
					<div class="">
						<p>Email</p>
						<input type="text" class="name" placeholder="Enter your email id" name="email" required="required"/>
					</div>

					<div class="">
						<p> Enter your phone number</p>
						<input type="text" class="name" placeholder="ex:xxxxxxxxxx" name="mobile" pattern="[6789][0-9]{9}" required />
					</div>
					<br>
                    <div class="">
						<p>Address</p>
						
						<select name="address" class="name" required="required" style="width: 100%;">
							    <option value="">--select--</option>
							    <option value="Amberpet">Amberpet</option>
								<option value="Ameerpet">Ameerpet</option>
								<option value="Balapur">Balapur</option>
								<option value="Banjarahills">Banjarahills</option>
								<option value="Bandlaguda">Bandlaguda</option>
								<option value="Chandrayangutta">Chandrayangutta</option>
								<option value="Chottuppal">Chottuppal</option>
								<option value="Charminar">Charminar</option>
								<option value="dilsukhnagar">Dilsukhnagar</option>
								<option value="Gachibowli">Gachibowli</option>
								<option value="Hitech-city">Hitech-city</option>
								<option value="haythnagar">haythnagar</option>
								<option value="jubliee-hills">jubliee-hills</option>
								<option value="Koti">Koti</option>
								<option value="kachiguda">kachiguda</option>
								<option value="kothapet">kothapet</option>
								<option value="lbnagar">Lbnagar</option>
								<option value="Lakdi ka pul">Lakdi ka pul</option>
								<option value="malakpet">Malakpet</option>
								<option value="Madapur">Madapur</option>
								<option value="midhani">midhani</option>
								<option value="nampally">nampally</option>
								<option value="raidurgam">raidurgam</option>
								<option value="Secunderabad">Secunderabad</option>
								<option value="shamshabad">shamshabad</option>
							    <option value="santhoshnagar">Santhosh Nagar</option>
							    <option value="uppal">Uppal</option>
						</select>
					</div>
					
					<div class="">
						<p>Select User Type</p>
						
						<select name="usertype" class="name" required="required" style="width: 100%;">
							<option value="">--select--</option>
							<option value="donor">donor</option>
							<option value="orphanage">Orphanage</option>
							<option value="agent">agent</option>
						</select>
						
					</div>

					<br />
					<input type="submit" value="Register" style="background-color: teal; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer; width: 100%; font-size: 16px;"> <!-- Change register button to black -->
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>
                        