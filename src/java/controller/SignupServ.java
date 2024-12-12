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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name="SignupServ", urlPatterns={"/signup"})
public class SignupServ extends HttpServlet {
   
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
            out.println("<title>Servlet SignupServ</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServ at " + request.getContextPath () + "</h1>");
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
        String r_name = request.getParameter("name");
        String r_email = request.getParameter("email");
        String r_phone = request.getParameter("phone");
        String r_address = request.getParameter("address");
        String r_username = request.getParameter("username");
        String r_password = request.getParameter("pass");
        String r_repass = request.getParameter("re_pass");
        UserDAO d = new UserDAO();
        User u = d.searchByUName(r_username);
        if(u==null){
            if(r_password.equals(r_repass)){
                User uNew = new User(1, r_name, r_email, r_username, r_password,r_address,r_phone,0,1,null);
                d.insert(uNew);
                response.sendRedirect("signin?direct=home");
            } else {
                String error = "Mật khẩu không trùng khớp! Hãy thử lại.";
                request.setAttribute("error", error);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            String error = "Tên đăng nhập đã tồn tại! Hãy thử lại.";
            request.setAttribute("error", error);
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
