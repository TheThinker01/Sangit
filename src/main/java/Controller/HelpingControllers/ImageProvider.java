package Controller.HelpingControllers;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;

@WebServlet(urlPatterns = "/img")
public class ImageProvider extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String path = req.getParameter("path");
        String applicationPath = getServletContext().getRealPath("");
        path = applicationPath+path;

        System.out.println(path);

        String fileExtension = getFileExtension(path);
        System.out.println(fileExtension);
        try {
            File file = new File(path);
            BufferedImage image = ImageIO.read(file);
            if (fileExtension.toLowerCase().equals("jpg") || fileExtension.toLowerCase().equals("jpeg"))
                ImageIO.write(image, "JPG", resp.getOutputStream());
            else
                ImageIO.write(image, "PNG", resp.getOutputStream());
        }
        catch (Exception e)
        {
            try{
            FileInputStream fis = new FileInputStream(new File(path));
            BufferedInputStream bis = new BufferedInputStream(fis);
            resp.setContentType("image/jpg");
            BufferedOutputStream output = new BufferedOutputStream(resp.getOutputStream());
            for (int data; (data = bis.read()) > -1;) {
                output.write(data);
            }
        }
        catch(IOException E){
            System.out.println(E);
        }
        }

        // Method 2
        //        String mime = cntx.getMimeType(path);
//        if (mime == null) {
//            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            return;
//        }
//        String filename = path;
//        resp.setContentType(mime);
//        File file = new File(filename);
//        resp.setContentLength((int)file.length());
//
//        FileInputStream in = new FileInputStream(file);
//        OutputStream out = resp.getOutputStream();
//
//        // Copy the contents of the file to the output stream
//        byte[] buf = new byte[1024];
//        int count = 0;
//        while ((count = in.read(buf)) >= 0) {
//            out.write(buf, 0, count);
//        }
//        out.close();
//        in.close();

//
//        try{
//
//            FileInputStream fis = new FileInputStream(new File(path));
//            BufferedInputStream bis = new BufferedInputStream(fis);
//            resp.setContentType("image/jpg");
//            BufferedOutputStream output = new BufferedOutputStream(resp.getOutputStream());
//            for (int data; (data = bis.read()) > -1;) {
//                output.write(data);
//            }
//        }
//        catch(IOException e){
//            System.out.println(e);
//        }
    }
    private static String getFileExtension(String fileName) {
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
            return fileName.substring(fileName.lastIndexOf(".")+1);
        else return "";
    }

}
