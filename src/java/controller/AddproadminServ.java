/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ImageProductDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author ASUS
 */
@MultipartConfig()
@WebServlet(name = "AddproadminServ", urlPatterns = {"/addproadmin"})
public class AddproadminServ extends HttpServlet {

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
            out.println("<title>Servlet AddproadminServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddproadminServ at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cd = new CategoryDAO();
        List<Category> listcat = cd.getAll();
        request.setAttribute("listcat", listcat);
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String r_cid = request.getParameter("cid");
        String descrip = request.getParameter("descrip");
        String warranty = request.getParameter("warranty");
        int price, quantity, cid;

        try {
            cid = Integer.parseInt(r_cid);
            String realPath = "D:\\PRJ301\\CellCity\\web\\images\\sanpham";
            List<String> imageList = new ArrayList<>();
            String linkFile = "images/sanpham/";
            //String realPath = "D:\\PRJ301\\Assignment-Demo\\web\\images";
            // Định nghĩa đường dẫn lưu trữ file
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            for (Part part : request.getParts()) {
                // Kiểm tra xem phần này có phải là file không
                if (part.getName().equals("image") && part.getSize() > 0) {
                    String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString(); // Lấy tên file

                    // Ghi file vào đường dẫn thực tế
                    part.write(realPath + "/" + fileName);
                    imageList.add(linkFile + fileName); 
                    // Lưu đường dẫn tương đối của file
                    
                }
            }
            ProductDAO pd = new ProductDAO();
            ImageProductDAO ipd = new ImageProductDAO();
            Product p_new = new Product(1, name, descrip, cid, warranty,null,null);
            int pid = pd.insert(p_new);
            ipd.insert(imageList, pid);
            response.sendRedirect("addprodetail?id="+pid);

        } catch (NumberFormatException n) {

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
