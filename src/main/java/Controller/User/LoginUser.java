package Controller.User;

import Bean.User;
import DAO.UserDeclaration;
import DAO.UserInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class LoginUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/User/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username,password;
        String category;
        category = req.getParameter("category");
        username = req.getParameter("username");
        password = req.getParameter("password");
        User u = new User();
        u.setPassword(password);
        u.setUsername(username);
        UserInterface ui = new UserDeclaration();
        User u2 = ui.signIn(u);
        if(u2!=null)
        {
            req.getSession().setAttribute("LoggedIn",u2);
            resp.sendRedirect("homepage.jsp");//TODO: Replace this with the homepage link for normal user
            // and admin panel link for admin users
            System.out.println("The User is logged in with "+username);
        }
        else{
            // TODO : Handle the user incorrect details appropriately
        }
    }
}
