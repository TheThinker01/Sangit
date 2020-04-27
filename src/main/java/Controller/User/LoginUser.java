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
        String mtype = "success";
        String error = "Enter your username and password";
        req.setAttribute("mtype",mtype);
        req.setAttribute("error",error);
//        req.setAttribute("next",next);
        req.getRequestDispatcher("WEB-INF/User/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String next = req.getParameter("next");

        String username,password;
        String category;
        category = req.getParameter("category");
        username = req.getParameter("username");
//        System.out.println("The User is logged in with "+username);

        password = req.getParameter("password");
//        System.out.println("The User is logged in with "+password);


        UserInterface ui = new UserDeclaration();
        User u2 = ui.signIn(username,password);
        if(u2!=null)
        {
            req.getSession().setAttribute("loggedIn",u2);
            // If the user was redirected from the page stored in "next" , send him back there
            if(next!=null)
            {
                resp.sendRedirect(next);
            }
            else{
                // Else redirect to the homepage
                resp.sendRedirect("/");
            }
//            resp.sendRedirect("homepage.jsp");//TODO: Replace this with the homepage link for normal user
            // and admin panel link for admin users
            System.out.println("The User is logged in with "+u2.getName());
        }
        else{
            // TODO : Handle the user incorrect details appropriately
            String mtype = "danger";
            String error = "Username or Password entered is incorrect";
            req.setAttribute("mtype",mtype);
            req.setAttribute("error",error);
            req.setAttribute("next",next);
            System.out.println("The User login attempt failed");
            System.out.println();

            req.getRequestDispatcher("WEB-INF/User/login.jsp").forward(req,resp);
        }
    }
}
