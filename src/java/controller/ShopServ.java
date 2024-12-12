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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "ShopServ", urlPatterns = {"/shop"})
public class ShopServ extends HttpServlet {

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
            out.println("<title>Servlet ShopServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServ at " + request.getContextPath() + "</h1>");
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
    private static final int PRODUCTS_PER_PAGE = 12;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Map<String, String> filters = new HashMap<>();
        String[] r_cid = request.getParameterValues("cid");
        String[] chipset = request.getParameterValues("chipset");
        String[] r_screensize = request.getParameterValues("screensize");
        int[] cid = new int[100];
        String cidStr = "";
        String chipStr = "";
        String scrSize = "";
        ProductDetailDAO pdd = new ProductDetailDAO();
        ReviewDAO rd = new ReviewDAO();
        if (r_cid != null) {

            if (!r_cid[0].equals("0")) {

                for (int i = 0; i < r_cid.length; i++) {
                    if (i < r_cid.length - 1) {
                        cidStr += r_cid[i] + ",";
                    } else {
                        cidStr += r_cid[i];
                    }
                }
                filters.put("category", cidStr);
            }
            for (int i = 0; i < r_cid.length; i++) {
                cid[i] = Integer.parseInt(r_cid[i]);
            }
        }
        if (chipset != null) {

            if (!chipset[0].equals("")) {

                for (int i = 0; i < chipset.length; i++) {
                    if (i < chipset.length - 1) {
                        chipStr += chipset[i] + ",";
                    } else {
                        chipStr += chipset[i];
                    }
                }
                filters.put("chipset", chipStr);
            }
        }
        if (r_screensize != null) {

            if (!r_screensize[0].equals("0")) {

                for (int i = 0; i < r_screensize.length; i++) {
                    if (i < r_screensize.length - 1) {
                        scrSize += r_screensize[i] + ",";
                    } else {
                        scrSize += r_screensize[i];
                    }
                }
                filters.put("screenSize", scrSize);
            }
        }
        String minPrice = request.getParameter("priceFrom");
        if (minPrice != null && !minPrice.isEmpty()) {
            filters.put("minPrice", minPrice);
        }
        String maxPrice = request.getParameter("priceTo");
        if (maxPrice != null && !maxPrice.isEmpty()) {
            filters.put("maxPrice", maxPrice);
        }
        
        String sortBy = request.getParameter("sortby");
        if (sortBy != null && !sortBy.equals("all")) {
            filters.put("sortby", sortBy);
        }
        String search = request.getParameter("search");
        if (search != null) {
            filters.put("search", search);
        }
        CategoryDAO cd = new CategoryDAO();
        List<Category> listcat = cd.getAll();
        List<Integer> countByCat = new ArrayList<>();
        for (int i = 0; i < listcat.size(); i++) {
            countByCat.add(cd.countByCat(listcat.get(i).getCategoryId()));
        }
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
        List<Item> listitem = cart.getItems();
        int cartsize;
        if (listitem != null) {
            cartsize = listitem.size();
        } else {
            cartsize = 0;
        }
        

        List<ProductDetail> listprobycat = pdd.getAllByFilter(filters);
        ProductDAO pd = new ProductDAO();
        ColorDAO colord = new ColorDAO();
        List<Color> listallcolor = colord.getAll();
        ImageProductDAO ipd = new ImageProductDAO();
        List<Product> listpro = pd.getAll();
        List<ImageProduct> listallfirstimage = ipd.getFirstEachPid();
        int currentPage = 1;
        String page = request.getParameter("page");
        if (page != null && !page.isEmpty()) {
            currentPage = Integer.parseInt(page);
        }
        int totalProducts = listprobycat.size();
        int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
        int startIndex = (currentPage - 1) * PRODUCTS_PER_PAGE;
        int endIndex = Math.min(startIndex + PRODUCTS_PER_PAGE, totalProducts);

        // Slice the list
        List<ProductDetail> slicedProducts = listprobycat.subList(startIndex, endIndex);
        List<Integer> listRatingPro = new ArrayList<>();
        for(int i=0;i<slicedProducts.size();i++){
            listRatingPro.add(rd.getAverageRating(slicedProducts.get(i).getId()));
        }
        request.setAttribute("cart", cart);
        request.setAttribute("minPr", minPrice);
        request.setAttribute("listRatingPro", listRatingPro);
        request.setAttribute("maxPr", maxPrice);
        request.setAttribute("cartsize", cartsize);
        request.setAttribute("search", search);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("slicedProducts", slicedProducts);
        request.setAttribute("screenSize", r_screensize);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("listcid", cid);
        request.setAttribute("listallcolor", listallcolor);
        request.setAttribute("colorlist", listallcolor);
        request.setAttribute("listpro", listpro);
        request.setAttribute("listallfirstimage", listallfirstimage);
        request.setAttribute("listprobycat", listprobycat);
        request.setAttribute("countByCat", countByCat);
        request.setAttribute("listcat", listcat);
        request.setAttribute("chipsetlist", chipset);
        request.setAttribute("filters", filters);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

        try {

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
