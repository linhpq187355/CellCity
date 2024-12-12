/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import model.ProductDetail;

/**
 *
 * @author ASUS
 */
@WebServlet(name="SetSaleServlet", urlPatterns={"/setsale"})
public class SetSaleServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SetSaleServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SetSaleServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        request.getRequestDispatcher("setsale.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String r_id = request.getParameter("id");
        String rsale_price = request.getParameter("sale_price");
        String r_duration = request.getParameter("duration");
        
        try{
            int id = Integer.parseInt(r_id);
            int sale_price = Integer.parseInt(rsale_price);
            int duration = Integer.parseInt(r_duration);
            
            LocalDateTime saleStart = LocalDateTime.now();
            LocalDateTime saleEnd = saleStart.plus(duration, ChronoUnit.HOURS);
            ProductDetail pd = new ProductDetail(id, "", 1, 1, "", "", 1, "", "", "", 1, 1, 1, 1, 1, 1, null, null, saleStart, saleEnd, sale_price, 1);
            ProductDetailDAO pdd = new ProductDetailDAO();
            ProductDetail n = pdd.getById(id);
            boolean check = pdd.updatesale(pd);
            if (check) {
                // Thêm sản phẩm thành công
                request.getSession().setAttribute("successMessageSale", "Set sale thành công!");
            } else {
                // Thêm sản phẩm thất bại
                request.getSession().setAttribute("errorMessageSale", "Set sale thất bại. Vui lòng thử lại!");
            }
            response.sendRedirect("listproadmin?id="+n.getProductID());
        }catch(NumberFormatException n){
            
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
