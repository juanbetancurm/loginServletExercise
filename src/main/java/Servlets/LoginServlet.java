package Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoginServ", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String user = request.getParameter("usuario");
        String pass = request.getParameter("contrasena");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String url = "jdbc:mysql://localhost:3306/burguerdb";
        Connection connection;
        PreparedStatement preparedStatement= null;
        ResultSet rs = null;

        try {
            connection = DriverManager.getConnection(url, "root", "12345");
            String querySQL = "SELECT * FROM empleado WHERE nombre_empleado= ? AND identificacion= ?";
            preparedStatement = connection.prepareStatement(querySQL);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                request.getSession().setAttribute("nombre_usuario", user);
                response.sendRedirect(request.getContextPath() + "/MenuPrincipalServlet.jsp");
            }else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
