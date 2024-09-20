<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>

</head>
<body>
	<form action="registration-form" method="GET">
		<!-- Các trường thông tin trong form -->
        First Name: <input type="text" name="txtFName"/><br/>
        Last Name: <input type="text" name="txtLName"/><br/>
        Date of Birth: 
        <select name="day">
            <%
                for (int i = 1; i <= 31; i++) {
            %>
                <option value="<%= i %>"><%= i %></option>
            <%
                }
            %>
        </select>
        
        <select name="month">
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
        </select>
        
        <select name="year">
            <%
                int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
                for (int i = currentYear; i >= 1900; i--) {
            %>
                <option value="<%= i %>"><%= i %></option>
            <%
                }
            %>
        </select>
        <br/>
        
        Email: <input type="text" name="txtEmail"/><br/>
        Mobile Number: <input type="text" name="txtMobileNumber"/><br/>
        Gender: 
        <input type="radio" name="gender" value="Male"/> Male
        <input type="radio" name="gender" value="Female"/> Female
        <br/>
        
        Address: <textarea name="txtAddress"></textarea><br/>
        City: <input type="text" name="txtCity"/><br/>
        Pin Code: <input type="text" name="txtPinCode"/><br/>
        State: <input type="text" name="txtState"/><br/>
        Country: <input type="text" name="txtCountry"/><br/>
        
        Hobbies: 
        <input type="checkbox" name="chkHobbies" value="Drawing"/> Drawing
        <input type="checkbox" name="chkHobbies" value="Singing"/> Singing
        <input type="checkbox" name="chkHobbies" value="Dancing"/> Dancing
        <input type="checkbox" name="chkHobbies" value="Sketching"/> Sketching
        <br/>
        
        Qualification:
        <table border="1">
        <tr>
            <th>Examination</th>
            <th>Board</th>
            <th>Percentage</th>
            <th>Year of Passing</th>
        </tr>
        <tr>
            <td>Class X</td>
            <td><input type="text" name="classXBoard"/></td>
            <td><input type="text" name="classXPercentage"/></td>
            <td><input type="text" name="classXYear"/></td>
        </tr>
        <tr>
            <td>Class XII</td>
            <td><input type="text" name="classXIIBoard"/></td>
            <td><input type="text" name="classXIIPercentage"/></td>
            <td><input type="text" name="classXIIYear"/></td>
        </tr>
        <tr>
            <td>Graduation</td>
            <td><input type="text" name="graduationBoard"/></td>
            <td><input type="text" name="graduationPercentage"/></td>
            <td><input type="text" name="graduationYear"/></td>
        </tr>
        <tr>
            <td>Masters</td>
            <td><input type="text" name="mastersBoard"/></td>
            <td><input type="text" name="mastersPercentage"/></td>
            <td><input type="text" name="mastersYear"/></td>
        </tr>
        </table>
        
        Course: 
        <input type="radio" name="txtCourse" value="BCA"/> BCA
        <input type="radio" name="txtCourse" value="B.Com"/> B.Com
        <input type="radio" name="txtCourse" value="B.Sc"/> B.Sc
        <input type="radio" name="txtCourse" value="B.A"/> B.A
        <br/>
        
        <input type="submit" value="Submit"/>
        <input type="reset" value="Reset"/> <!-- Added Reset Button -->
    </form>

    <!-- Thêm liên kết đến trang sản phẩm -->
    <br/>
    <a href="${pageContext.request.contextPath}/product">Go to Product Page</a>
    <br/>
    <a href="${pageContext.request.contextPath}/register">Go to Bai2 Page</a>
    <br/>
    <a href="login.jsp">Go to Bai3</a>

</body>
</html>
