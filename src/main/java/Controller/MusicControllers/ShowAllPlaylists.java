package Controller.MusicControllers;

import DAO.PlaylistDeclaration;
import DAO.PlaylistInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ListIterator;

@WebServlet(urlPatterns = "/admin/ShowAllPlaylists")
public class ShowAllPlaylists extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PlaylistInterface pi = new PlaylistDeclaration();
        List res = pi.selectAllPlaylists();
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
        req.getRequestDispatcher("/WEB-INF/MusicPages/ShowAllPlaylists.jsp").forward(req,resp);
    }
}
