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
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Color;
import model.ImageProduct;
import model.Item;
import model.Product;
import model.ProductDetail;
import model.Review;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "HomeServ", urlPatterns = {"/home"})
public class HomeServ extends HttpServlet {

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
            out.println("<title>Servlet HomeServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServ at " + request.getContextPath() + "</h1>");
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
        ColorDAO colord = new ColorDAO();
        ProductDAO pd = new ProductDAO();
        ProductDetailDAO pdd = new ProductDetailDAO();
        CategoryDAO cd = new CategoryDAO();
        ReviewDAO rd = new ReviewDAO();
        ImageProductDAO ipd = new ImageProductDAO();
        List<ProductDetail> listsale = pdd.getAllSale();
        List<ProductDetail> listallnew = pdd.getAllNewPro();
        List<ImageProduct> listallfirstimage = ipd.getFirstEachPid();
        List<Product> listallproduct = pd.getAll();
        List<Color> listallcolor = colord.getAll();
        List<Category> listcat = cd.getAll();
        List<ProductDetail> listallprodetail = pdd.getAll();
        List<ProductDetail> listAllTopSale = pdd.getAllTopSale();
        List<ProductDetail> listAllTopRating = pdd.getAllTopRating();
        List<List<ProductDetail>> listnewbycat = new ArrayList<>();
        for (int i = 0; i < listcat.size(); i++) {
            listnewbycat.add(pdd.getNewPro(listcat.get(i).getCategoryId()));
        }
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
        List<String> saleTime = new ArrayList<>();
        for (int i = 0; i < listsale.size(); i++) {
            LocalDateTime endTime = listsale.get(i).getSale_end();
            LocalDateTime startTime = LocalDateTime.now();
            long hours = ChronoUnit.HOURS.between(startTime, endTime);
            long minutes = ChronoUnit.MINUTES.between(startTime, endTime) % 60; // Số phút, loại bỏ giờ
            long seconds = ChronoUnit.SECONDS.between(startTime, endTime) % 60; // Số giây, loại bỏ phút và giờ
            String durition = hours + "h" + minutes + "m" + seconds;
            saleTime.add(durition);
        }
        List<Integer> listReviewAllNew = new ArrayList<>();
        for(int i=0;i<listallnew.size();i++){
            listReviewAllNew.add(rd.getAverageRating(listallnew.get(i).getId()));
        }
        List<List<Integer>> listReviewByCat = new ArrayList<>();
        for(int i=0;i<listnewbycat.size();i++){
            List<Integer> l = new ArrayList<>();
            for(int j=0;j<listnewbycat.get(i).size();j++){
                l.add(rd.getAverageRating(listnewbycat.get(i).get(j).getId()));
            }
            listReviewByCat.add(l);
        }
        List<Review> listAllAvgRating = rd.getAllAvgRating();
        request.setAttribute("listcat", listcat);
        request.setAttribute("listAllTopRating", listAllTopRating);
        request.setAttribute("listAllAvgRating", listAllAvgRating);
        request.setAttribute("listAllTopSale", listAllTopSale);
        request.setAttribute("listReviewAllNew", listReviewAllNew);
        request.setAttribute("listReviewByCat", listReviewByCat);
        request.setAttribute("cart", cart);
        request.setAttribute("cartsize", cartsize);
        request.setAttribute("listallfirstimage", listallfirstimage);
        request.setAttribute("listnewbycat", listnewbycat);
        request.setAttribute("colorlist", listallcolor);
        request.setAttribute("listallcolor", listallcolor);
        request.setAttribute("listallproduct", listallproduct);
        request.setAttribute("listallnew", listallnew);
        request.setAttribute("listsale", listsale);
        request.setAttribute("listtime", saleTime);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
