package Controller.MusicControllers;

import Bean.Music;
import DAO.MusicDeclaration;
import DAO.MusicInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/addRating")
public class AddRating extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long music_id = Long.parseLong(req.getParameter("musicid"));
        long rating = Long.parseLong(req.getParameter("rating"));
        MusicInterface mi = new MusicDeclaration();
        Music m =mi.selectMusic(music_id);
        long orat = m.getRating();
        long oratc = m.getRatingCount();
        long newrat = (orat*oratc + rating)/(oratc+1);
        oratc++;
        m.setRatingCount(oratc);
        m.setRating(newrat);
        mi.updateMusic(music_id,m);
        resp.sendRedirect("/");
    }
}
