package Controller.MusicProvider;

import DAO.MusicDeclaration;
import DAO.MusicInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ListIterator;

@WebServlet(urlPatterns = "/mp/showMyMusic")
public class ShowMyMusic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MusicInterface mi = new MusicDeclaration();
        long id=Long.parseLong(req.getParameter("id"));
        List res = mi.selectByUser(id);
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
        req.getRequestDispatcher("WEB-INF/MusicProvider/ShowMyTracks").forward(req,resp);

    }
}
