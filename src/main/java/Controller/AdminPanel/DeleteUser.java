package Controller.AdminPanel;

import DAO.UserDeclaration;
import DAO.UserInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/DeleteUser")
public class DeleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        UserInterface sto = new UserDeclaration();
        boolean flag = sto.deleteUser(id);
        if(flag){
            // Delete Successful
            String mtype = "success";// Set the alert type
            String heading = "Success";// Set the heading
            String message = "The selected data has been deleted!";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);

        }
        else {
            // Delete Unsuccessful
            String mtype = "danger";// Set the alert type
            String heading = "Failed";// Set the heading
            String message = "The selected data could not be deleted!";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
        }
    }

}
