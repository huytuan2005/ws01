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
@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/ProductController", "/CategoryController", "/AccountController"})
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Account user = (Account) session.getAttribute("userLoggedIn");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String path = req.getServletPath();
        String action = req.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "list";
        }
        int role = user.getRoleInSystem();
        if (!hasPermission(role, path, action)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        chain.doFilter(request, response);
    }

    private boolean hasPermission(int role, String path, String action) {
        if (path.equals("/AccountController")) {
            if (action.equals("list") || action.equals("view")) {
                return role == 1 || role == 2;
            }
            return role == 1;
        }

        if (path.equals("/CategoryController")) {
            switch (action) {
                case "list":
                case "view":
                    return role >= 1 && role <= 5;
                case "create":
                case "insert":
                case "update":
                    return role == 1 || role == 2;
                case "delete":
                case "remove":
                    return role == 1 || role == 2;
                default:
                    return false;
            }
        }
        if (path.equals("/ProductController")) {
            switch (action) {
                case "list":
                case "view":
                    return role >= 1 && role <= 5;
                case "create":
                case "insert":
                case "update":
                    return role == 1 || role == 2 || role == 3;
                case "delete":
                case "remove":
                    return role == 1 || role == 2;
                default:
                    return false;
            }
        }
        return false;
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }

}
