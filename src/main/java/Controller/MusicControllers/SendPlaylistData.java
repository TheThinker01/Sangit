package Controller.MusicControllers;

import Bean.Music;
import Bean.Playlist;
import DAO.PlaylistDeclaration;
import DAO.PlaylistInterface;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@WebServlet(urlPatterns = "/sendPlaylistData")
public class SendPlaylistData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        PlaylistInterface pi = new PlaylistDeclaration();
        Playlist p = pi.selectPlaylist(id);
        Set<Music> musicSet= p.getSongList();

        List<Music> musicList = new ArrayList<Music>();

        Iterator it = musicSet.iterator();
        while(it.hasNext())
        {
            Music temp =(Music) it.next();
            temp.setPlaylists(null);
            musicList.add(temp);
        }

        Gson gson = new Gson();
        String json = gson.toJson(musicList);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}
