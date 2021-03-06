package cn.edu.lnsf.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        if(request.getSession().getAttribute("userInfo")==null){
            String requestURI = request.getRequestURI();
            if(requestURI.contains("admin")){
                if (request.getSession().getAttribute("userInfo1")==null){
                    response.sendRedirect("/adminLogin.jsp");
                }
            }else{
                response.sendRedirect("/login.jsp");
            }
        }
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
