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
import dal.ReviewDAO;
import dal.UserDAO;
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
import model.Review;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ProductServ", urlPatterns = {"/product"})
public class ProductServ extends HttpServlet {

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
            out.println("<title>Servlet ProductServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServ at " + request.getContextPath() + "</h1>");
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
        String r_id = request.getParameter("id");
        ProductDetailDAO pdd = new ProductDetailDAO();
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(r_id);
            ProductDetail p = pdd.getById(id);
            ProductDAO pd = new ProductDAO();
            ImageProductDAO ipd = new ImageProductDAO();
            CategoryDAO cd = new CategoryDAO();
            ReviewDAO rd = new ReviewDAO();
            ColorDAO colord = new ColorDAO();
            UserDAO ud = new UserDAO();
            List<Category> listcat = cd.getAll();
            List<Color> colorlist = colord.getAll();
            List<ImageProduct> listimg = ipd.getImgByPid(p.getProductID());
            List<ProductDetail> listtypepro = pdd.getAll(p.getProductID());
            List<ProductDetail> listramrom = pdd.getAllRamrom(p.getProductID());
            List<ProductDetail> listallprodetail = pdd.getAll();
            Product product = pd.getById(p.getProductID());
            List<ProductDetail> listmustlike = pdd.getFirstByCid(product.getCategoryId());
            List<ImageProduct> listallfirstimage = ipd.getFirstEachPid();
            List<Product> listallproduct = pd.getAll();
            List<Review> listreview = rd.getReviewsByProductID(id);
            List<User> listuser = ud.getAll();
            int rating = rd.getAverageRating(id);
            //cart
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
            List<Item> listitem = cart.getItems();
            int cartsize;
            if (listitem != null) {
                cartsize = listitem.size();
            } else {
                cartsize = 0;
            }
            List<Review> listAllAvgRating = rd.getAllAvgRating();
            request.setAttribute("productdetail", p);
            request.setAttribute("listAllAvgRating", listAllAvgRating);
            request.setAttribute("cart", cart);
            request.setAttribute("rating", rating);
            request.setAttribute("numReview", listreview.size());
            request.setAttribute("listuser", listuser);
            request.setAttribute("listreview", listreview);
            request.setAttribute("cartsize", cartsize);
            request.setAttribute("productimg", listimg);
            request.setAttribute("listtypepro", listtypepro);
            request.setAttribute("product", product);
            request.setAttribute("listcat", listcat);
            request.setAttribute("colorlist", colorlist);
            request.setAttribute("listramrom", listramrom);
            request.setAttribute("listmustlike", listmustlike);
            request.setAttribute("listallfirstimage", listallfirstimage);
            request.setAttribute("listallproduct", listallproduct);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (NumberFormatException n) {

        }
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
        PrintWriter out = response.getWriter();
        out.print("ok");
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
