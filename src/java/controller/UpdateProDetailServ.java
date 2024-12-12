/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ColorDAO;
import dal.ProductDAO;
import dal.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Color;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author ASUS
 */
@WebServlet(name="UpdateProDetailServ", urlPatterns={"/updateprodetail"})
public class UpdateProDetailServ extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateProDetailServ</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProDetailServ at " + request.getContextPath () + "</h1>");
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
        String r_pid = request.getParameter("pid");
        try{
            int id = Integer.parseInt(r_id);
            int pid = Integer.parseInt(r_pid);
            ProductDAO prod = new ProductDAO();
            ProductDetailDAO pdd = new ProductDetailDAO();
            ColorDAO cd = new ColorDAO();
            Product p = prod.getById(pid);
            ProductDetail pd = pdd.getById(id);
            List<Color> c = cd.getAll();
            request.setAttribute("prode", pd);
            request.setAttribute("pro", p);
            request.setAttribute("color", c);
            request.getRequestDispatcher("updateproductdetail.jsp").forward(request, response);
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
        String r_proid = request.getParameter("proid");
        String r_id = request.getParameter("id");
        String screenTech = request.getParameter("screentech");
        String r_ram = request.getParameter("ram");
        String r_rom = request.getParameter("rom");
        String frontCam = request.getParameter("frontCam");
        String backCam = request.getParameter("backCam");
        String r_pin = request.getParameter("pin");
        String os = request.getParameter("os");
        String sim = request.getParameter("sim");
        String chipset = request.getParameter("chipSet");
        String r_screensize = request.getParameter("screenSize");
        String r_refreshrate = request.getParameter("refreshRate");
        String r_color = request.getParameter("color");
        String r_stockQuantity = request.getParameter("stockQuantity");
        String r_price = request.getParameter("price");
        
        try {
            int id = Integer.parseInt(r_id);
            int ram = Integer.parseInt(r_ram);
            int rom = Integer.parseInt(r_rom);
            int pin = Integer.parseInt(r_pin);
            float screenSize = Float.parseFloat(r_screensize);
            int refreshrate = Integer.parseInt(r_refreshrate);
            int color = Integer.parseInt(r_color);
            int stockQuantity = Integer.parseInt(r_stockQuantity);
            int price = Integer.parseInt(r_price);
            int proid = Integer.parseInt(r_proid);
            ProductDetail pd = new ProductDetail(id, screenTech, ram, rom, frontCam, backCam, pin, os, sim, chipset, proid, screenSize, refreshrate, price, stockQuantity, color, null, null,null,null,0,0);
            ProductDetailDAO pdd = new ProductDetailDAO();
            boolean check = pdd.update(pd);
            if (check) {
                // Thêm sản phẩm thành công
                request.getSession().setAttribute("successMessageUpdate", "Sửa sản phẩm thành công!");
            } else {
                // Thêm sản phẩm thất bại
                request.getSession().setAttribute("errorMessageUpdate", "Sửa sản phẩm thất bại. Vui lòng thử lại!");
            }
            response.sendRedirect("listproadmin?id="+proid);
        } catch (NumberFormatException n) {

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
