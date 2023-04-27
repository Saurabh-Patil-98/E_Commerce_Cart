<%@page import="com.connection.DBUtil"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.*"%>
<%@ page import="com.modules.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DBUtil.getMySQLConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email</label> <input type="text" class="form-control"
							placeholder="Enter Email" name="email" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" placeholder="Enter Password"
							name="password" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button><br><br>

						<p class="mb-0">
							<a href="registration.jsp" class="text-center btn btn-primary">Register a new
								User!</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
