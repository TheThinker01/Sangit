package Controller.MusicControllers;

import Bean.Music;
import DAO.MusicDeclaration;
import DAO.MusicInterface;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

@WebServlet(urlPatterns = "/searchSongs")
public class SearchSongs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("name");
        MusicInterface mi = new MusicDeclaration();
        List musicList = mi.searchByTitle(title);

        List<Music> songlist = new ArrayList<Music>();
        ListIterator it = musicList.listIterator();

        while(it.hasNext())
        {
            Music temp =(Music) it.next();
            temp.setPlaylists(null);
            songlist.add(temp);
        }

        Gson gson = new Gson();
        String json = gson.toJson(songlist);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}
