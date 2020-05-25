package Controller.MusicControllers;

import Bean.Music;
import DAO.MusicDeclaration;
import DAO.MusicInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;


@WebServlet(urlPatterns = "/addMusic")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 20, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 60)
public class CreateMusic extends HttpServlet {
    public static final String UPLOAD_DIR = "static"+ File.separator + "media";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/MusicPages/AddMusicTrack.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String applicationPath = getServletContext().getRealPath(""),
                uploadPath = applicationPath+File.separator + UPLOAD_DIR;

        // Now album images are to be stored at /img
        // and the audio files in media itself
        String mPath = File.separator + UPLOAD_DIR ;
        String imgPath = File.separator + UPLOAD_DIR + File.separator + "img" ;
//        System.out.println("This is not working");

        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        fileUploadDirectory = new File(imgPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }



        String title,artist,albumart,musicfile,song;
        long duration,userid;
        albumart = "";
        musicfile = "";
        song = "";
        title = req.getParameter("title");
        artist = req.getParameter("artist");
        duration =Long.parseLong(req.getParameter("duration"));
        userid = Long.parseLong(req.getParameter("userid"));
        // Extract file
        String fileName="";
        String fileExtension = null;
        for (Part part : req.getParts()) {

            fileName = extractFileName(part);
            fileName = title+fileName;

            fileExtension = getFileExtension(fileName);
            System.out.println("The file extension is :" + fileExtension);
            try {

                if(fileExtension.equals("mp3"))// If it is a audio file
                {
                    System.out.println("Audio file detected");
                    musicfile = uploadPath + File.separator + fileName;
                    song = fileName;
                    part.write(uploadPath + File.separator + fileName);
                    System.out.println(uploadPath + File.separator + fileName);
                }
                if(fileExtension.toLowerCase().equals("jpg") || fileExtension.toLowerCase().equals("png")||fileExtension.toLowerCase().equals("jpeg")) {
                    System.out.println("Image file detected");
                    albumart = uploadPath+ File.separator + "img" + File.separator + fileName;
                    part.write(uploadPath+ File.separator + "img" + File.separator + fileName);
                    System.out.println(imgPath + File.separator + fileName);
                }System.out.println("Upload Success");
            } catch (IOException ioObj) {
                System.out.println("Failure : " + ioObj.getMessage());
            }
        }
        System.out.println(req.getParameter("title"));

//        duration=0;
        Music m = new Music(0,0,title,artist,albumart,song,musicfile,duration,userid);
        MusicInterface mi = new MusicDeclaration();
        mi.musicInsert(m);

        String mtype = "success";
        String error = "The track was uploaded";
        String heading = "Success!";
        req.setAttribute("mtype",mtype);
        req.setAttribute("heading",heading);
        req.setAttribute("message",error);

        req.getRequestDispatcher("WEB-INF/common/showMessage.jsp").forward(req,resp);

    }

    private String extractFileName(Part part) {
        String fileName = "",
                contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return fileName;
    }

    private static String getFileExtension(String fileName) {
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
            return fileName.substring(fileName.lastIndexOf(".")+1);
        else return "";
    }

}
