<!DOCTYPE html>
<html>
<head>
<title>User Registration Form</title>

</head>
<body>
	<h2>User Registration Form</h2>
	<form action="register" method="post">
		<label>First Name: </label> <input type="text" name="firstName"
			required><br> <label>Last Name: </label> <input
			type="text" name="lastName" required><br> <label>Email:
		</label> <input type="email" name="email" required><br> <label>Re-enter
			Email: </label> <input type="email" name="reEmail" required><br>

		<label>Password: </label> <input type="password" name="password"
			required><br> <label>Birthday: </label> <select
			name="month">
			<option value="January">January</option>
			<option value="February">February</option>
			<option value="March">March</option>
			<option value="April">April</option>
			<option value="May">May</option>
			<option value="June">June</option>
			<option value="July">July</option>
			<option value="August">August</option>
			<option value="September">September</option>
			<option value="October">October</option>
			<option value="November">November</option>
			<option value="December">December</option>
		</select> <select name="day">
			<%
			for (int i = 1; i <= 31; i++) {
			%>
			<option value="<%=i%>"><%=i%></option>
			<%
			}
			%>
		</select> <select name="year">
			<%
			int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
			for (int i = currentYear; i >= 1900; i--) {
			%>
			<option value="<%=i%>"><%=i%></option>
			<%
			}
			%>
		</select><br> <label>Gender: </label> <input type="radio" name="gender"
			value="Male"> Male <input type="radio" name="gender"
			value="Female"> Female<br> <input type="submit"
			value="Sign Up">
	</form>
	<br/>
    <a href="registration-form.jsp">Go to Bai1</a>
    <br/>
    <a href="login.jsp">Go to Bai3</a>
    <br/>
    <a href="${pageContext.request.contextPath}/product">Go to Product Page</a>
</body>
</html>
