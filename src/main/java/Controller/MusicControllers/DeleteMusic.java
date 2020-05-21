package Controller.MusicControllers;

import Bean.Music;
import Bean.Playlist;
import DAO.MusicDeclaration;
import DAO.MusicInterface;
import DAO.PlaylistDeclaration;
import DAO.PlaylistInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

@WebServlet(urlPatterns = "/admin/DeleteMusic")
public class DeleteMusic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        MusicInterface sto = new MusicDeclaration();
        Music m = sto.selectMusic(id);
        // Find all the playlists it is part of
        Set<Playlist> playlists = m.getPlaylists();

        PlaylistInterface pi = new PlaylistDeclaration();
        // Now remove it from each of these playlists
        Iterator it = playlists.iterator();

        while(it.hasNext())
        {

            Playlist p =(Playlist) it.next();
            p.removeSong(m);
            // Update in database
            pi.updatePlaylist(p.getId(),p);
        }

        // Finally delete song from database
        boolean flag = sto.deleteMusic(id);
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
