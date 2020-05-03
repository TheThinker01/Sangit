package Controller.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;



@WebFilter(urlPatterns = "/user/*")
public class LoginRequiredFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
//        System.out.println(request.getRequestURI());
        String next =request.getRequestURI();
        System.out.println("next : "+next);
        if(request.getSession().getAttribute("loggedIn")!=null)
        {
            filterChain.doFilter(servletRequest,servletResponse);
        }
        else{
            String mtype = "danger";
            String error = "You need To sign in to continue";
            request.setAttribute("mtype",mtype);
            request.setAttribute("error",error);
            request.setAttribute("next",next);

            request.getRequestDispatcher("/WEB-INF/User/login.jsp").forward(servletRequest,servletResponse);

        }
    }
    @Override
    public void destroy() {

    }
}
