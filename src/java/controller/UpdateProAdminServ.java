/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ImageProductDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author ASUS
 */
@WebServlet(name="UpdateProAdminServ", urlPatterns={"/updateproadmin"})
public class UpdateProAdminServ extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateProAdminServ</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProAdminServ at " + request.getContextPath () + "</h1>");
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
        try {
            int id = Integer.parseInt(r_id);
            ProductDAO pd = new ProductDAO();
            ImageProductDAO ipd = new ImageProductDAO();
            CategoryDAO cdd = new CategoryDAO();
            List<Category> listcat = cdd.getAll();
            Product pro = pd.getById(id);
            List<String> listImage = ipd.getAllByPid(id);
            request.setAttribute("pro", pro);
            request.setAttribute("listimg", listImage);
            request.setAttribute("listcat", listcat);
            request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
        }catch(NumberFormatException n){
            
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
        String r_id = request.getParameter("id");
        String name = request.getParameter("name");
        String r_cid = request.getParameter("cid");
        String descrip = request.getParameter("descrip");
        String warranty = request.getParameter("warranty");
        
        try{
            int cid = Integer.parseInt(r_cid);
            int id = Integer.parseInt(r_id);
            ProductDAO pd = new ProductDAO();
            Product d = new Product(id,name,descrip,cid,warranty,null,null);
            pd.update(d);
            response.sendRedirect("listproo");
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
