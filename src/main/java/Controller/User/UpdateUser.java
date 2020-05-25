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

@WebServlet(urlPatterns = "/updateProfile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50)
public class UpdateUser extends HttpServlet {
    public static final String UPLOAD_DIR = "uploadedFiles";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInterface ui = new UserDeclaration();
        long id=0;
        User temp= (User) req.getSession().getAttribute("loggedIn");

        if(temp!=null)
        {   // If user is logged then allow him/her to edit his/her profile
            System.out.println("Using The login  parameter");
            id = temp.getId();
            if(req.getParameter("id")!=null && temp.getCategory().equals("Admin"))
            {// If user is logged in as Admin allow to change any profile
                System.out.println("Using The Admin access");
                id = Long.parseLong(req.getParameter("id"));
            }
        }
        else{
            // If user is not logged in then redirect to login page wit next parameter
            String next = req.getRequestURI();
            System.out.println("Nothing!!!");
            String mtype = "danger";
            String error = "You need to sign in to continue";
            req.setAttribute("mtype",mtype);
            req.setAttribute("error",error);
            req.setAttribute("next",next);

            req.getRequestDispatcher("WEB-INF/User/login.jsp").forward(req,resp);
            return ;
        }

        User u = ui.selectUser(id);
        req.setAttribute("st",u);
        req.getRequestDispatcher("/WEB-INF/User/showProfile.jsp").forward(req,resp);
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
        long id = Long.parseLong(req.getParameter("id"));
        name = req.getParameter("name");
        password = req.getParameter("password");
        email = req.getParameter("email");
        mobile_num = req.getParameter("mobile_num");
        category = req.getParameter("category");
        username = req.getParameter("username");
        System.out.println("The photopath field is :"+photopath);
        password = BCrypt.hashpw(password,BCrypt.gensalt(12));

        UserInterface ui = new UserDeclaration();
        User temp = new User(name,  password,  email,  mobile_num, category, photopath , username);
        ui.updateUser(id,temp);
        User u = ui.selectUser(id);
        req.setAttribute("st",u);
        req.getRequestDispatcher("/WEB-INF/User/showProfile.jsp").forward(req,resp);
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
