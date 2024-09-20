package bai2.controller;

import bai2.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    // Database connection parameters
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=DangkyUser";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123456789";

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("SQL Server JDBC driver not found", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieving form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String birthDate = request.getParameter("month") + "/" + request.getParameter("day") + "/" + request.getParameter("year");

        // Creating user object
        User newUser = new User(firstName, lastName, email, password, gender, birthDate);

        // Save user to database
        saveUserToDatabase(newUser);

        // Storing user in request
        request.setAttribute("user", newUser);

        // Forwarding to JSP for displaying users (without password)
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

    private void saveUserToDatabase(User user) {
        String insertQuery = "INSERT INTO Users (firstName, lastName, email, password, gender, birthDate) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {

            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getGender());
            preparedStatement.setString(6, user.getBirthDate());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Handle exception
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
