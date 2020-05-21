package Controller.MusicControllers;

import Bean.User;
import DAO.MusicDeclaration;
import DAO.MusicInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ListIterator;

@WebServlet(urlPatterns = "/showAllMusic")
public class ShowAllMusic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User temp =  (User) req.getSession().getAttribute("loggedIn");
        if(temp==null || !temp.getCategory().equals("Admin")){
            String next = req.getRequestURI();
//            System.out.println("Nothing!!!");
            String mtype = "danger";
            String error = "You need a staff account to continue";
            req.setAttribute("mtype",mtype);
            req.setAttribute("error",error);
            req.setAttribute("next",next);

            req.getRequestDispatcher("WEB-INF/User/login.jsp").forward(req,resp);
            return ;
        }
        MusicInterface mi = new MusicDeclaration();
        List res = mi.selectAllMusics();
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
        req.getRequestDispatcher("WEB-INF/MusicPages/ShowAllTracks.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MusicInterface mi = new MusicDeclaration();
        String name = req.getParameter("search");
        List res = mi.searchByTitle(name);
        ListIterator it;
        String message;
        if(!res.isEmpty())
        {   it = res.listIterator();
            req.setAttribute("it",it);
            message = "The matching results are";
        }
        else
        {
            message="No matching records found";
        }
        req.setAttribute("message",message);

        req.getRequestDispatcher("/WEB-INF/MusicPages/ShowAllTracks.jsp").forward(req,resp);
    }
}
