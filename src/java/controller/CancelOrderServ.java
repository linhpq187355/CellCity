/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDetailDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;
import model.OrderDetail;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author ASUS
 */
@WebServlet(name="CancelOrderServ", urlPatterns={"/cancalOrder"})
public class CancelOrderServ extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CancelOrderServ.class.getName());
   
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
            out.println("<title>Servlet CancelOrderServ</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelOrderServ at " + request.getContextPath () + "</h1>");
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
        
        String r_id = request.getParameter("id");
        OrderDAO od = new OrderDAO();      
        OrderDetailDAO odd = new OrderDetailDAO();
        ProductDetailDAO pdd = new ProductDetailDAO();
        UserDAO ud = new UserDAO();
        try{
            int id = Integer.parseInt(r_id);
            od.cancelOrder(id);
            Order o = od.getOrderById(id);
            if(o.getPayment().equals("Ví")){
                ud.updateAmount(ud.getAmount(o.getUserId())+o.getTotalAmount(), o.getUserId());
            }
            List<OrderDetail> listod = odd.getAllByOId(id);
            for(int i=0;i<listod.size();i++){
                pdd.updateQuantity(listod.get(i).getQuantity(), listod.get(i).getProductDetailId());
            }
            response.sendRedirect("userorder");
        }catch(NumberFormatException n){
            logger.log(Level.SEVERE, "ID không hợp lệ: {0}", r_id);

            request.setAttribute("error", "ID đơn hàng không hợp lệ!");
            
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
