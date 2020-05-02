package Controller.HelpingControllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet(urlPatterns = "/music")
public class MusicProvider extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getParameter("path");

        try{

            FileInputStream fis = new FileInputStream(new File(path));
            BufferedInputStream bis = new BufferedInputStream(fis);
            resp.setContentType("music/mp3");
            BufferedOutputStream output = new BufferedOutputStream(resp.getOutputStream());
            for (int data; (data = bis.read()) > -1;) {
                output.write(data);
            }
        }
        catch(IOException e){
            System.out.println(e);
        }
    }
}
