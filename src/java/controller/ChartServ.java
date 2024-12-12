/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.CategoryDAO;
import dal.PieDAO;
import dal.SaleChartDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Category;
import model.PieChart;
import model.SaleChart;
import model.UserChart;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ChartServ", urlPatterns = {"/chart"})
public class ChartServ extends HttpServlet {

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
            out.println("<title>Servlet ChartServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartServ at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        CategoryDAO cd = new CategoryDAO();
        PieDAO pied = new PieDAO();
        UserDAO ud = new UserDAO();
        SaleChartDAO scd = new SaleChartDAO();
        List<Category> listcat = cd.getAll();
        Map<String, Integer> listpie = new HashMap<>();
        for (int i = 0; i < listcat.size(); i++) {
            PieChart p = pied.fetchDataFromDatabase(listcat.get(i).getCategoryName(), listcat.get(i).getCategoryId());
            listpie.put(p.getLabel(), p.getValue());
        }
        Map<Integer, Integer> listsalechart = new HashMap<>();
        List<SaleChart> listsalechart1 = scd.getSaleMonths();
        for (int i = 0; i < listsalechart1.size(); i++) {
            listsalechart.put(listsalechart1.get(i).getMonth(), listsalechart1.get(i).getTotalSales());
        }
        
        Map<Integer, Integer> listsalechartweek = new HashMap<>();
        List<SaleChart> listsalechartweek1 = scd.getSaleWeeks();
        for (int i = 0; i < listsalechartweek1.size(); i++) {
            listsalechartweek.put(listsalechartweek1.get(i).getMonth(), listsalechartweek1.get(i).getTotalSales());
        }
        
        Map<Integer, Integer> listusermonth = new HashMap<>();
        List<UserChart> listusermonth1 = ud.getUserMonths();
        for (int i = 0; i < listusermonth1.size(); i++) {
            listusermonth.put(listusermonth1.get(i).getMonth(), listusermonth1.get(i).getNumOfUser());
        }
        
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("pieData", listpie);
        responseData.put("saleChartData", listsalechart);
        responseData.put("saleChartWeekData", listsalechartweek);
        responseData.put("listusermonth", listusermonth);
        Gson gson = new Gson();
        String json = gson.toJson(responseData);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(json);
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
