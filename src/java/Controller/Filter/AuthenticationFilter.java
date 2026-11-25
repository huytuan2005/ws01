/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Controller.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DTO.Account;

/**
 *
 * @author phuct
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/ProductController", "/CategoryController", "/AccountController"})
public class AuthenticationFilter implements Filter {
    
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpServletRequest req= (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        
        HttpSession session = req.getSession(false);
        Account user = null;
        
        if(session!=null){
            user = (Account) session.getAttribute("userLoggedIn");
        }
        
        if(user==null){
            resp.sendRedirect("login.jsp");
            return;
        }
        
        chain.doFilter(request, response);
    }

   @Override
    public void destroy() {        
    }
    
    @Override
    public void init(FilterConfig filterConfig) {        
    }
}
        
    


