package Controller.AdminPanel;

import DAO.IssueDeclaration;
import DAO.IssueInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/DeleteIssue")
public class DeleteIssue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        IssueInterface ii = new IssueDeclaration();
        boolean flag = ii.deleteIssue(id);
        if(flag==false)
        {
            String mtype = "danger";// Set the alert type
            String heading = "Failed";// Set the heading
            String message = "Could not delete. Check Error Log!";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
        }
        else
        {
            resp.sendRedirect("/admin/showAllIssues");
        }
    }
}
