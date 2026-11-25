/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Account;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.AccountDAO;
import model.DTO.Account;

/**
 *
 * @author phuct
 */
@WebServlet(name = "UpdateAccount", urlPatterns = {"/UpdateAccount"})
public class UpdateAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        AccountDAO dao = new AccountDAO(getServletContext());
        String udc = request.getParameter("updateController");
        if(udc==null){
             String id = request.getParameter("account");
            Account ac = dao.getObjectById(id);
            if(ac!=null){
                request.setAttribute("account", ac);
                 request.getRequestDispatcher("account/update.jsp").forward(request, response);
            }
           
        }else{
            String account = request.getParameter("account");
            String pass = request.getParameter("pass");
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            Date birthday = java.sql.Date.valueOf(request.getParameter("birthday"));
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            boolean isUse = Boolean.parseBoolean(request.getParameter("isUse"));
            int roleInSystem = Integer.parseInt(request.getParameter("roleInSystem"));
            Account ac = new Account(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem);
            if(dao.updateRec(ac)!=0){
                request.setAttribute("success",account+ " update success");
            }else{
                request.setAttribute("error",account+ " update fail");
            }
        request.setAttribute("list", dao.listAll());
         request.getRequestDispatcher("account/list.jsp").forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
