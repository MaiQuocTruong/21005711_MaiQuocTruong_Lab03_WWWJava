<%@page import="bai1.entities.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result submit</title>
</head>
<body>
	<%
        Student student = (Student) request.getAttribute("student");
        if (student != null) {
    %>
	<h1>Registration Details</h1>
	First name:
	<%= student.getFirstName() %>
	<br /> Last name:
	<%= student.getLastName() %>
	<br /> Email:
	<%= student.getEmail() %>
	<br /> Mobile Number:
	<%= student.getMobileNumber() %>
	<br /> Gender:
	<%= student.getGender() %>
	<br /> Birthdate:
	<%= student.getBirthdate() %>
	<br /> Address:
	<%= student.getAddress() %>
	<br /> City:
	<%= student.getCity() %>
	<br /> Pin Code:
	<%= student.getPinCode() %>
	<br /> State:
	<%= student.getState() %>
	<br /> Country:
	<%= student.getCountry() %>
	<br /> Hobbies:
	<%= student.getHobbies() %>
	<br /> Course:
	<%= student.getCourse() %>
	<br />
	Qualification
	<table border="1">
		<tr>
			<th>Examination</th>
			<th>Board</th>
			<th>Percentage</th>
			<th>Year of Passing</th>
		</tr>
		<tr>
			<td>Class X</td>
			<td><%= student.getClassXBoard() %></td>
			<td><%= student.getClassXPercentage() %></td>
			<td><%= student.getClassXYear() %></td>
		</tr>
		<tr>
			<td>Class XII</td>
			<td><%= student.getClassXIIBoard() %></td>
			<td><%= student.getClassXIIPercentage() %></td>
			<td><%= student.getClassXIIYear() %></td>
		</tr>
		<tr>
			<td>Graduation</td>
			<td><%= student.getGraduationBoard() %></td>
			<td><%= student.getGraduationPercentage() %></td>
			<td><%= student.getGraduationYear() %></td>
		</tr>
		<tr>
			<td>Masters</td>
			<td><%= student.getMastersBoard() %></td>
			<td><%= student.getMastersPercentage() %></td>
			<td><%= student.getMastersYear() %></td>
		</tr>
	</table>

	<%
        } else {
    %>
	<h1>No registration data found!</h1>
	<%
        }
    %>
</body>
</html>
