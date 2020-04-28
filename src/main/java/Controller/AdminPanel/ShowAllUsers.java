package Controller.AdminPanel;

import DAO.UserDeclaration;
import DAO.UserInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ListIterator;

@WebServlet(urlPatterns = "/admin/ShowAllUsers")
public class ShowAllUsers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInterface sts =new UserDeclaration();
        List res  = (sts.selectAllUsers());
        String message;
        if(res!=null) {
            ListIterator it = res.listIterator();
            req.setAttribute("it", it);
            message = "All the results are";
        }
        else{
            message="No records found";
        }
        req.setAttribute("message",message);
        req.getRequestDispatcher("/WEB-INF/AdminPanel/ShowAllUsers.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInterface sts =new UserDeclaration();
        String name = req.getParameter("search");
        List res = sts.searchByName(name);
        ListIterator it;
        String message;
        if(!res.isEmpty())
        {   it = res.listIterator();
            req.setAttribute("it",it);
            message = "The matching results are";
        }
        else
        {
            message="No matching records found";
        }
        req.setAttribute("message",message);

        req.getRequestDispatcher("/WEB-INF/AdminPanel/ShowAllUsers.jsp").forward(req,resp);
    }

}
