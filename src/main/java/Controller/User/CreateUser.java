package Controller.User;

import Bean.User;
import DAO.UserDeclaration;
import DAO.UserInterface;
import HelpingClasses.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(urlPatterns = "/addUser")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50)
public class CreateUser extends HttpServlet {
    public static final String UPLOAD_DIR = "uploadedFiles";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/User/register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name,password,email,mobile_num,category,username;

        String applicationPath = getServletContext().getRealPath(""),
                uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        String shortUploadPath = File.separator + UPLOAD_DIR;

        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String photopath=null;
        String fileName = "";
        for (Part part : req.getParts()) {
            fileName = extractFileName(part);

            try {
                part.write(uploadPath + File.separator + fileName);
                System.out.println(uploadPath + File.separator + fileName);
                photopath = (shortUploadPath + File.separator + fileName).toString();
                System.out.println("Upload Success");
            } catch (IOException ioObj) {

                System.out.println("Failure : " + ioObj.getMessage());
            }
        }

        name = req.getParameter("name");
        password = req.getParameter("password");
        email = req.getParameter("email");
        mobile_num = req.getParameter("mobile_num");
        category = req.getParameter("category");
        username = req.getParameter("username");
        System.out.println("The photopath field is :"+photopath);
        password = BCrypt.hashpw(password,BCrypt.gensalt(12));

        UserInterface ui = new UserDeclaration();
        ui.userInsert(new User(name,  password,  email,  mobile_num, category, photopath , username));
        resp.sendRedirect("/");

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
}
