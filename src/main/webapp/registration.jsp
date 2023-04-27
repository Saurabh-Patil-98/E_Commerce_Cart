<%@page import="com.modules.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@include file="includes/header.jsp"%>
</head>

<body>


<%@include file="includes/navbar.jsp"%>



	<div class="formbold-main-wrapper">
		<!-- Author: FormBold Team -->
		<!-- Learn More: https://formbold.com -->
		<div class="formbold-form-wrapper">

			<img src="your-image-url-here.jpg">

			<form action="RegistrationServlet" method="post">
				<div class="formbold-form-title">
					<h2 class="">Register now</h2>

				</div>

				<div class="formbold-input-flex">
					<div>
						<label for="firstname" class="formbold-form-label"> First
							name </label> <input type="text" name="firstname" id="firstname"
							class="formbold-form-input" />
					</div>
					<div>
						<label for="lastname" class="formbold-form-label"> Last
							name </label> <input type="text" name="lastname" id="lastname"
							class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-input-flex">
					<div>
						<label for="email" class="formbold-form-label"> Email </label> <input
							type="email" name="email" id="email" class="formbold-form-input" />
					</div>
					<div>
						<label for="phone" class="formbold-form-label"> Phone
							number </label> <input type="text" name="phone" id="phone"
							class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="address" class="formbold-form-label"> District
					 </label> <input type="text" name="address" id="address"
						class="formbold-form-input" />
				</div>



				<div class="formbold-input-flex">
					<div>
						<label for="state" class="formbold-form-label">
							State</label> <input type="text" name="state" id="state"
							class="formbold-form-input" />
					</div>
					<div>
						<label for="country" class="formbold-form-label"> Country
						</label> <input type="text" name="country" id="country"
							class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-input-flex">
					<div>
						<label for="post" class="formbold-form-label"> Post/Zip
							code </label> <input type="text" name="post" id="post"
							class="formbold-form-input" />
					</div>
					<div>
						<label for="area" class="formbold-form-label"> Area Code </label>
						<input type="text" name="area" id="area"
							class="formbold-form-input" />
					</div>
				</div>




				<div class="formbold-input-flex">
					<div>
						<label for="password" class="formbold-form-label">
							Password </label> <input type="text" name="password" id="password"
							class="formbold-form-input" />
					</div>




					<div class="formbold-checkbox-wrapper">
						<label for="supportCheckbox" class="formbold-checkbox-label">
							<div class="formbold-relative">
								<input type="checkbox" id="supportCheckbox"
									class="formbold-input-checkbox" />
								<button type="submit" class="formbold-btn" name="submit ">Register
									Now</button>
								<!-- <a href="Login.html" class="formbold-btn">Login</a> -->
			</form>
		</div>
	</div>
	<style>
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', sans-serif;
}

.formbold-mb-3 {
	margin-bottom: 15px;
}

.formbold-relative {
	position: relative;
}

.formbold-opacity-0 {
	opacity: 0;
}

.formbold-stroke-current {
	stroke: currentColor;
}

#supportCheckbox:checked ~ div span {
	opacity: 1;
}

.formbold-main-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 48px;
}

.formbold-form-wrapper {
	margin: 0 auto;
	max-width: 570px;
	width: 100%;
	background: white;
	padding: 40px;
}

.formbold-img {
	margin-bottom: 45px;
}

.formbold-form-title {
	margin-bottom: 30px;
}

.formbold-form-title h2 {
	font-weight: 600;
	font-size: 28px;
	line-height: 34px;
	color: #07074d;
}

.formbold-form-title p {
	font-size: 16px;
	line-height: 24px;
	color: #536387;
	margin-top: 12px;
}

.formbold-input-flex {
	display: flex;
	gap: 20px;
	margin-bottom: 15px;
}

.formbold-input-flex>div {
	width: 50%;
}

.formbold-form-input {
	text-align: center;
	width: 100%;
	padding: 13px 22px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 16px;
	color: #536387;
	outline: none;
	resize: none;
}

.formbold-form-input:focus {
	border-color: #6a64f1;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-form-label {
	color: #536387;
	font-size: 14px;
	line-height: 24px;
	display: block;
	margin-bottom: 10px;
}

.formbold-checkbox-label {
	display: flex;
	cursor: pointer;
	user-select: none;
	font-size: 16px;
	line-height: 24px;
	color: #536387;
}

.formbold-checkbox-label a {
	margin-left: 5px;
	color: #6a64f1;
}

.formbold-input-checkbox {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	white-space: nowrap;
	border-width: 0;
}

.formbold-checkbox-inner {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 20px;
	height: 20px;
	margin-right: 16px;
	margin-top: 2px;
	border: 0.7px solid #dde3ec;
	border-radius: 3px;
}

.formbold-btn {
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: none;
	font-weight: 500;
	background-color: #6a64f1;
	color: white;
	cursor: pointer;
	margin-top: 25px;
}

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}
</style>






<%@include file="includes/footer.jsp"%>
</body>
</html>