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

@WebServlet(urlPatterns = "/user/rsfp")
public class RemoveSongFromPlaylist extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long pid = Long.parseLong(req.getParameter("pid"));
        long mid = Long.parseLong(req.getParameter("mid"));

        // Check for missing parameters
        if(req.getParameter("pid")==null || req.getParameter("mid")==null){
            String mtype = "danger";// Set the alert type
            String heading = "Oops";// Set the heading
            String message = "The selected data was not found";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
            return;
        }

        PlaylistInterface pi = new PlaylistDeclaration();
        MusicInterface mi = new MusicDeclaration();

        Playlist p = pi.selectPlaylist(pid);
        Music m = mi.selectMusic(mid);

        m.removeFromPlaylists(p);
        p.removeSong(m);

        long flag1 = pi.updatePlaylist(pid,p);
        long flag2 = mi.updateMusic(mid,m);

        if(flag1!=0 && flag2!=0)
        {
            String mtype = "success";// Set the alert type
            String heading = "Success";// Set the heading
            String message = "The selected song has been deleted from your playlist!";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
        }
        else{
            String mtype = "danger";// Set the alert type
            String heading = "Failed";// Set the heading
            String message = "The selected song could not be deleted! Contact Admin if this issue persists";//message to be displayed

            req.setAttribute("mtype",mtype);
            req.setAttribute("heading",heading);
            req.setAttribute("message",message);
            req.getRequestDispatcher("/WEB-INF/common/showMessage.jsp").forward(req,resp);
        }

    }

}
