/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SigninServ", urlPatterns = {"/signin"})
public class SigninServ extends HttpServlet {

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
            out.println("<title>Servlet SigninServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SigninServ at " + request.getContextPath() + "</h1>");
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
        String direct = request.getParameter("direct");
        request.setAttribute("direct", direct);
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String name = request.getParameter("your_name");
        String pass = request.getParameter("your_pass");
        String remem = request.getParameter("remember-me");
        String direct = request.getParameter("directt");
        request.setAttribute("direct", direct);
        UserDAO d = new UserDAO();
        User u = d.searchByUName(name);
        if (u == null) {
            String error = "Tên đăng nhập không tồn tại! Hãy thử lại.";
            request.setAttribute("error", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (!u.getPassword().equals(pass)) {
                String error = "Mật khẩu không đúng! Hãy thử lại.";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("account", u);
                Cookie cuname = new Cookie("user",name);
                Cookie cupass = new Cookie("pass",pass);
                Cookie crem = new Cookie("rem",remem);
                if(remem==null){
                    cuname.setMaxAge(0);
                    cupass.setMaxAge(0);
                    crem.setMaxAge(0);
                } else {
                    cuname.setMaxAge(7*24*60*60);
                    cupass.setMaxAge(7*24*60*60);
                    crem.setMaxAge(7*24*60*60);
                }
                response.addCookie(cuname);
                response.addCookie(cupass);
                response.addCookie(crem);
                if(u.getRole()==1){
                    response.sendRedirect(direct);
                } else response.sendRedirect("admin");
                
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
