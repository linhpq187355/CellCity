/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ColorDAO;
import dal.ImageProductDAO;
import dal.ProductDAO;
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
import model.Category;
import model.Color;
import model.ImageProduct;
import model.Item;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ShowCartServ", urlPatterns = {"/showcart"})
public class ShowCartServ extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowCartServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowCartServ at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        ProductDetailDAO pdd = new ProductDetailDAO();
        ProductDAO pd = new ProductDAO();
        ColorDAO colord = new ColorDAO();
        ImageProductDAO ipd = new ImageProductDAO();
        CategoryDAO cd = new CategoryDAO();
        List<Category> listcat = cd.getAll();
        List<ProductDetail> listallprodetail = pdd.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, listallprodetail);
        List<Product> listallproduct = pd.getAll();
        List<Item> listitem = cart.getItems();
        List<Color> colorlist = colord.getAll();
        List<ImageProduct> listallfirstimage = ipd.getFirstEachPid();
        
        int cartsize;
        if (listitem != null) {
            cartsize = listitem.size();
        } else {
            cartsize = 0;
        }
        request.setAttribute("cart", cart);
        request.setAttribute("cartsize", cartsize);
        request.setAttribute("listallproduct", listallproduct);
        request.setAttribute("colorlist", colorlist);
        request.setAttribute("listallfirstimage", listallfirstimage);
        request.setAttribute("listcat", listcat);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
