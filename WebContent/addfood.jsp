<!DOCTYPE HTML>
<html>
<head>
    <%@include file="header.html"%>
    <style>
        .form-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .food-info {
            width: 60%;
            display: flex;
            flex-direction: column; /* Stack the message and image vertically */
            height: 100%; /* Ensure it takes the full height of the parent */
        }
        .login-form {
            width: 75%; /* Increased width of the form */
            margin-left: 20px;
        }
        .login-form form {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            height: 100%; /* Allow form to take full height */
            box-sizing: border-box; /* Include padding and border in height */
        }
        .donor-message {
            background-color: #e0f7fa; /* Light color for the message background */
            padding: 40px; /* Increased padding for larger message box */
            border-radius: 8px;
            color: #333; /* Darker text color for visibility */
            margin-bottom: 10px; /* Space below the message */
            flex-grow: 1; /* Allow message box to grow and fill available space */
            display: flex;
            flex-direction: column; /* Stack content in the message box */
            height: 200px; /* Set specific height for the message box */
        }
        .donor-message h2 {
            font-size: 24px;
            margin: 0; /* Remove default margin */
        }
        .images-container {
            flex-grow: 1; /* Allow image to grow */
            display: flex;
            justify-content: center; /* Center the image horizontally */
            align-items: center; /* Center the image vertically */
            margin-top: 20px; /* Add space above the image */
        }
        .images-container img {
            width: 100%;
            max-height: 100%; /* Allow image to scale within the container */
            border-radius: 8px;
            object-fit: cover; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
    <%@include file="menu2.jsp"%>
    <div class="register-form-main">
        <div class="container">
            <div class="title-div">
                <h3 class="tittle">
                   Add Food
                </h3>
            </div>

            <div class="form-container">
                <!-- Left side: Greeting message and image -->
                <div class="food-info">
                    <div class="donor-message">
                        <h2>Hello <%= username %>!</h2>
                        <p>Thank you for your generosity. Please fill out the details of the food you are donating. Your donation helps feed those in need and is deeply appreciated.</p>
                    </div>
                    <div class="images-container">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtKZW2R0bzOulM9PlJTfSaZ3a5_GU-19fqcA&s">
                    </div>
                </div>

                <!-- Right side: Add food form -->
                <div class="login-form">
                    <form name="form" action="VoidmainServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="Available" name="status">
                        <input type="hidden" value="<%= username %>" name="postedby">
                        
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
                            <p>Prepared Time (Mention am or pm)</p>
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
                       <input type="submit" value="Add Food" style="background-color: teal; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer; width: 100%; font-size: 16px;"> 
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.html"%>
</body>
</html>