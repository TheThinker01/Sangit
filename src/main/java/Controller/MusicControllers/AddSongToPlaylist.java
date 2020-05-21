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

@WebServlet(urlPatterns = "/user/addSongToPlaylist")
public class AddSongToPlaylist extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("musicid"));
        long music_id = Long.parseLong(req.getParameter("musicid"));
        long playlist_id = Long.parseLong(req.getParameter("playlist"));
        PlaylistInterface pi = new PlaylistDeclaration();
        // Select the playlist to be inserted to
        Playlist p = pi.selectPlaylist(playlist_id);
        MusicInterface mi = new MusicDeclaration();
        // Select the music file to be inserted
        Music m =mi.selectMusic(music_id);
        // Many To Many Mapping
        // So First Add Song to Playlist
        p.getSongList().add(m);
        // And add playlist to song
        m.addToPlaylists(p);

        // Finally update playlist
        pi.updatePlaylist(playlist_id,p);
        // Update Music
        mi.updateMusic(music_id,m);
        resp.sendRedirect("/");
    }
}
