package Controller.MusicControllers;

import Bean.Playlist;
import Bean.User;
import DAO.PlaylistDeclaration;
import DAO.PlaylistInterface;
import DAO.UserDeclaration;
import DAO.UserInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/user/addPlaylist")
public class CreatePlaylist extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/Homepages/addPlaylist.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String visibility = req.getParameter("visibility");
        User adder = (User)req.getSession().getAttribute("loggedIn");
        Playlist p = new Playlist(name,visibility);
        // Many To One Mapping - bidirectional
        // Set user in playlist
        p.setUser(adder);

        //Save the playlist
        PlaylistInterface pi = new PlaylistDeclaration();
        pi.playlistInsert(p);

        // Add playlist in user's list
        adder.addPlaylist(p);
        // Now update the user
        UserInterface ui = new UserDeclaration();
        ui.updateUser(adder.getId(),adder);

        resp.sendRedirect("/");
    }
}
