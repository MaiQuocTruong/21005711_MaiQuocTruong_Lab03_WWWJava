package bai1.registrationform;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import bai1.entities.Student;

/**
 * Servlet implementation class RegistrationForm
 */
@WebServlet(urlPatterns = { "/registration-form" })
public class RegistrationForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationForm() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get data from form
		String fname = request.getParameter("txtFName");
		String lname = request.getParameter("txtLName");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String email = request.getParameter("txtEmail");
		String mobileNumber = request.getParameter("txtMobileNumber");
		String gender = request.getParameter("gender");
		String address = request.getParameter("txtAddress");
		String city = request.getParameter("txtCity");
		String pinCode = request.getParameter("txtPinCode");
		String state = request.getParameter("txtState");
		String country = request.getParameter("txtCountry");
		String hobbies = request.getParameter("chkHobbies");
		String course = request.getParameter("txtCourse");

		// Combine day, month, year into birthdate
		String birthdate = day + " " + month + " " + year;

		// Qualification data extraction
		String classXBoard = request.getParameter("classXBoard");
		String classXPercentage = request.getParameter("classXPercentage");
		String classXYear = request.getParameter("classXYear");

		String classXIIBoard = request.getParameter("classXIIBoard");
		String classXIIPercentage = request.getParameter("classXIIPercentage");
		String classXIIYear = request.getParameter("classXIIYear");

		String graduationBoard = request.getParameter("graduationBoard");
		String graduationPercentage = request.getParameter("graduationPercentage");
		String graduationYear = request.getParameter("graduationYear");

		String mastersBoard = request.getParameter("mastersBoard");
		String mastersPercentage = request.getParameter("mastersPercentage");
		String mastersYear = request.getParameter("mastersYear");

		// Set data to Student object
		Student sv = new Student();
		sv.setFirstName(fname);
		sv.setLastName(lname);
		sv.setEmail(email);
		sv.setMobileNumber(mobileNumber);
		sv.setGender(gender);
		sv.setAddress(address);
		sv.setCity(city);
		sv.setPinCode(pinCode);
		sv.setState(state);
		sv.setCountry(country);
		sv.setHobbies(hobbies);
		sv.setBirthdate(birthdate);
		sv.setCourse(course);

		// Add qualifications to the student object (need new fields for this in Student
		// class)
		sv.setClassXBoard(classXBoard);
		sv.setClassXPercentage(classXPercentage);
		sv.setClassXYear(classXYear);

		sv.setClassXIIBoard(classXIIBoard);
		sv.setClassXIIPercentage(classXIIPercentage);
		sv.setClassXIIYear(classXIIYear);

		sv.setGraduationBoard(graduationBoard);
		sv.setGraduationPercentage(graduationPercentage);
		sv.setGraduationYear(graduationYear);

		sv.setMastersBoard(mastersBoard);
		sv.setMastersPercentage(mastersPercentage);
		sv.setMastersYear(mastersYear);
		// Set object to request
		request.setAttribute("student", sv);

		// Forward to result JSP
		RequestDispatcher rd = request.getRequestDispatcher("result-form.jsp");
		rd.forward(request, response);
	}
}
