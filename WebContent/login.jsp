<!DOCTYPE HTML>
<html>
<head>
    <%@include file="header.html"%>
    <style>
        body {
            margin: 0;
            background-color: white;
        }

        .register-form-main {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            padding-left: 600px;
            height: calc(100vh - 80px);
            background-image: url('https://t3.ftcdn.net/jpg/03/72/91/90/360_F_372919065_zhfG6pdi7SE6Z9Ceq9Q1tDMHdVHrVhIK.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            flex-direction: column;
            padding-top: 40px;
        }

        .welcome-message {
            font-size: 24px; /* Increased font size */
            color: white; /* Text color */
            text-align: center;
            font-family: 'Arial', sans-serif;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .login-form {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 350px;
            margin-top: 10px;
        }

        .title-div h3 {
            color: #06C167;
            text-align: center;
        }

        .login-form input {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            width: 100%;
        }

    </style>
</head>
<body>
    <%@include file="menu1.html"%>

    <div class="register-form-main">
        <!-- Welcome message -->
        <div class="welcome-message">
            Welcome back! Log in to connect surplus food with those who need it most
        </div>

        <!-- Login form -->
        <div class="login-form">
            <div class="title-div">
                <h3 class="tittle" style="color: black;">
                    Login
                </h3>
            </div>
            <form name="form" action="LoginServlet">
                <div class="">
                    <p>User Name</p>
                    <input type="text" class="name" name="username" required="required"/>
                </div>

                <div class="">
                    <p>Password</p>
                    <input type="password" class="name" name="password" required="required"/>
                </div>
                <br />
                <input type="submit" value="Login" style="background-color: teal; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer; width: 100%; font-size: 16px;">
            </form>
        </div>
    </div>

    <%@include file="footer.html"%>
</body>
</html>