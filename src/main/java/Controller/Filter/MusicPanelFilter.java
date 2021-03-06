package Controller.Filter;

import Bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(urlPatterns = "/mp/*")
public class MusicPanelFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
//        System.out.println(request.getRequestURI());
        User u = (User)request.getSession().getAttribute("loggedIn");
        String next =request.getRequestURI();
        if(u!=null && u.getCategory().equals("mp"))
        {
            filterChain.doFilter(servletRequest,servletResponse);
        }
        else{
            String mtype = "danger";
            String error = "You need a music provider account to view this page";
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
