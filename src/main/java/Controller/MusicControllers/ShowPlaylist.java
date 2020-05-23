package Controller.MusicControllers;

import Bean.Music;
import Bean.Playlist;
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

@WebServlet(urlPatterns = "/user/showPlaylist")
public class ShowPlaylist extends HttpServlet {
    // For displaying all tracks in a playlist
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("id")==null){
            String mtype = "danger";// Set the alert type
            String heading = "Oops";// Set the heading
            String message = "The selected data was not found";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
            return;
        }

        long id = Long.parseLong(req.getParameter("id"));
        PlaylistInterface pi = new PlaylistDeclaration();
        Playlist p = pi.selectPlaylist(id);
        Set<Music>songlists =  p.getSongList();

        String message;
        if(songlists!=null){
            Iterator it = songlists.iterator();
            req.setAttribute("it", it);
            message = "All the results are";
        }
        else{
            message="No records found";
        }
        req.setAttribute("message",message);
        req.setAttribute("playlistId",id);
        req.getRequestDispatcher("/WEB-INF/Homepages/showTracks.jsp").forward(req,resp);

    }
}
