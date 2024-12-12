/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Review;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ReviewServ", urlPatterns = {"/review"})
public class ReviewServ extends HttpServlet {

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
            out.println("<title>Servlet ReviewServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReviewServ at " + request.getContextPath() + "</h1>");
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
        String r_id = request.getParameter("productID");
        String r_rating = request.getParameter("rating");
        String comment = request.getParameter("comment");
        ReviewDAO rd = new ReviewDAO();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("account");
        if (user == null) {
            String direct = "product?id=" + r_id;
            String encodedDirect = java.net.URLEncoder.encode(direct, "UTF-8");
            response.sendRedirect("signin?direct=" + encodedDirect); // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        } else {
            try {
                int id = Integer.parseInt(r_id);
                int rating = Integer.parseInt(r_rating);
                Review r = new Review(1, id, user.getUserId(), rating, comment, null);
                rd.addReview(r);
                response.sendRedirect("product?id=" + id);
            } catch (NumberFormatException n) {
                // Handle the NumberFormatException if needed
            }
        }

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
