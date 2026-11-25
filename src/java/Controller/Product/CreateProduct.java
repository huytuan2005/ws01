/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.ProductDAO;
import model.DTO.Product;
import model.DAO.CategoryDAO;
import model.DTO.Account;
/**
 *
 * @author phuct
 */
@WebServlet(name = "CreateProduct", urlPatterns = {"/CreateProduct"})
public class CreateProduct extends HttpServlet {

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
         Account user = (Account) request.getSession().getAttribute("userLoggedIn");
         if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String account = user.getAccount();
        CategoryDAO caDAO = new CategoryDAO(getServletContext());
        ProductDAO dao = new ProductDAO(getServletContext());
        String productId = request.getParameter("productId");
        if(productId!=null){
            try {
                String productName = request.getParameter("productName");
                String productImage = request.getParameter("productImage");
                String getBrief = request.getParameter("brief");
                int typeId = Integer.parseInt( request.getParameter("typeId"));
                String unit = request.getParameter("unit");
                int price = Integer.parseInt(request.getParameter("price"));
                int discount = Integer.parseInt(request.getParameter("discount"));
                Product pd = new Product(productId, productName, productImage, getBrief, typeId, account, unit, price, discount);
                if(dao.insertRec(pd)>0){
                    request.setAttribute("success",pd.getProductName()+ " add success");
                }else{
                    request.setAttribute("error",pd.getProductName()+ " add fail");
                }
                
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            }
            request.setAttribute("list", dao.listAll());
            request.getRequestDispatcher("product/list.jsp").forward(request, response);
        }else{
            request.setAttribute("categories", caDAO.listAll());
            request.getRequestDispatcher("product/create.jsp").forward(request, response);
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
