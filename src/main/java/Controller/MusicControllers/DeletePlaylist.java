package Controller.MusicControllers;

import Bean.Music;
import Bean.Playlist;
import Bean.User;
import DAO.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

@WebServlet(urlPatterns = "/user/DeletePlaylist")
public class DeletePlaylist extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        PlaylistInterface pi = new PlaylistDeclaration();
        Playlist p = pi.selectPlaylist(id);
        //First remove this playlist from users list
        User u = p.getUser();
        u.removePlaylist(p);
        UserInterface ui = new UserDeclaration();
        ui.updateUserWithPlaylist(u.getId(),u);

        // Now remove this playlist from all the music tracks present in it
        Set<Music> songLists = p.getSongList();
        MusicInterface mi = new MusicDeclaration();
        Iterator it = songLists.iterator();

        while(it.hasNext())
        {
            Music m = (Music) it.next();
            m.removeFromPlaylists(p);
            mi.updateMusic(m.getId(),m);
        }
        boolean flag = pi.deletePlaylist(id);
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
