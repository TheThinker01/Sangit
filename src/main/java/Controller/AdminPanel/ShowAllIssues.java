package Controller.AdminPanel;

import DAO.IssueDeclaration;
import DAO.IssueInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ListIterator;

@WebServlet(urlPatterns = "/admin/showAllIssues")
public class ShowAllIssues extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IssueInterface ii = new IssueDeclaration();
        List res = ii.selectAllIssues();
        String message ;
        if(res == null)
        {
            message = "No Issues have been recorded yet!";
        }
        else {
            ListIterator it = res.listIterator();
            message = "The following issues were filed";
            req.setAttribute("it",it);
        }
        req.setAttribute("message",message);
        req.getRequestDispatcher("/WEB-INF/AdminPanel/ShowAllIssues.jsp").forward(req,resp);
    }

}
