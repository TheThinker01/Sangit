package Controller.User;

import Bean.Issue;
import DAO.IssueDeclaration;
import DAO.IssueInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/user/addIssue")
public class AddIssue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/User/AddIssue.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name,title,email,description;
        name = req.getParameter("name");
        title = req.getParameter("title");
        email = req.getParameter("email");
        description = req.getParameter("description");

        IssueInterface ii = new IssueDeclaration();
        Issue issue = new Issue(title,name,email,description);

        long flag = ii.issueInsert(issue);
        if(flag==0)
        {
            String mtype = "danger";// Set the alert type
            String heading = "Failed";// Set the heading
            String message = "The selected data could not be deleted!";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
        }
        else{
            // Delete Successful
            String mtype = "success";// Set the alert type
            String heading = "Success";// Set the heading
            String message = "Issue was filed! We will get back to you soon.";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);

        }
    }
}
