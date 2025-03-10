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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Item;
import model.ProductDetail;

/**
 *
 * @author ASUS
 */
@WebServlet(name="CartProcessServ", urlPatterns={"/cartprocess"})
public class CartProcessServ extends HttpServlet {
   
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
            out.println("<title>Servlet CartProcessServ</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartProcessServ at " + request.getContextPath () + "</h1>");
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
        ProductDetailDAO pdd = new ProductDetailDAO();
        List<ProductDetail> listallprodetail = pdd.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt,listallprodetail);
        String r_id = request.getParameter("id");
        String r_quan = request.getParameter("quantity");
        List<Item> items = cart.getItems();
        try{
            int id = Integer.parseInt(r_id);
            int quan = Integer.parseInt(r_quan);
            ProductDetail p = pdd.getById(id);
            int stockNumber = p.getStockQuantity();
            if(quan==0){
                cart.deleleItem(id);
            }
            for(int i=0;i<items.size();i++){
                if(items.get(i).getProduct().getId() == id){
                    items.get(i).setQuantity(quan);
                }
            }
        }catch(NumberFormatException n){
            
        }
        txt="";
        if(!items.isEmpty()){
            txt = items.get(0).getProduct().getId()+":"+items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt+="/"+items.get(i).getProduct().getId()+":"+items.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie("cart",txt);
        response.addCookie(c);
        response.sendRedirect("showcart");
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
        ProductDetailDAO pdd = new ProductDetailDAO();
        List<ProductDetail> listallprodetail = pdd.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String r_id = request.getParameter("id");
        String[] ids = txt.split("/");
        String out="";
        for(int i=0;i<ids.length;i++){
            String[] s = ids[i].split(":");
            if(!s[0].equals(r_id)){
                if(out.isEmpty()){
                    out=ids[i];
                } else {
                    out+="/"+ids[i];
                }
            }
        }
        if(!out.isEmpty()){
            Cookie c = new Cookie("cart",out);
            c.setMaxAge(30*24*60*60);
            response.addCookie(c);
        }
        response.sendRedirect("showcart");
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
