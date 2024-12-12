/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ColorDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.ProductDetailDAO;
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
import java.util.List;
import model.Cart;
import model.Category;
import model.Color;
import model.Item;
import model.Order;
import model.Product;
import model.ProductDetail;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CheckoutServ", urlPatterns = {"/checkout"})
public class CheckoutServ extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServ at " + request.getContextPath() + "</h1>");
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
        ProductDetailDAO pdd = new ProductDetailDAO();
        ProductDAO pd = new ProductDAO();
        ColorDAO colord = new ColorDAO();
        CategoryDAO cd = new CategoryDAO();
        List<Category> listcat = cd.getAll();
        List<ProductDetail> listallprodetail = pdd.getAll();
        List<Product> listallproduct = pd.getAll();
        List<Color> colorlist = colord.getAll();
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
        String r_shipping = request.getParameter("shipping");
        //String r_totalAmount = request.getParameter("totalAmount");
        String error = (String) request.getSession().getAttribute("er");
        if (error != null) {
            request.setAttribute("er", error);
            request.getSession().removeAttribute("er");
        }

        try {
            int shipping = Integer.parseInt(r_shipping);
            //int totalAmount = Integer.parseInt(r_totalAmount);
            cart.setTotal(shipping);
            request.setAttribute("cart", cart);
            request.setAttribute("shipping", shipping);
            request.setAttribute("cartsize", cartsize);
            request.setAttribute("listallproduct", listallproduct);
            request.setAttribute("listcat", listcat);
            request.setAttribute("colorlist", colorlist);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        String khac = request.getParameter("khac");
        ProductDetailDAO pdd = new ProductDetailDAO();
        OrderDAO od = new OrderDAO();
        UserDAO ud = new UserDAO();
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
        HttpSession session = request.getSession(false); // Tránh tạo mới session nếu không có

        String shipping = request.getParameter("shipping");
        int ship = Integer.parseInt(shipping);
        cart.setTotal(ship);
        String name, phone, address, email, note;
        if (khac == null) {
            name = request.getParameter("name");
            phone = request.getParameter("phone");
            address = request.getParameter("address");
            email = request.getParameter("email");
            note = request.getParameter("note");
        } else {
            name = request.getParameter("shippingName");
            phone = request.getParameter("shippingPhone");
            address = request.getParameter("shippingAddress");
            email = request.getParameter("shippingEmail");
            note = request.getParameter("shippingNote");
        }
        String direct = request.getParameter("direct");
        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect(direct);
            return;
        } else {
            User a = (User) session.getAttribute("account");
            String payment = request.getParameter("paymentMethod");
            if (payment.equals("0")) {
                if (a.getAmount() < cart.getTotalWithShip()) {
                    request.getSession().setAttribute("er", "Số dư không đủ để thanh toán!");
                    response.sendRedirect("checkout?shipping="+ship+"&totalAmount=1");
                } else {
                    Order o = new Order(1, a.getUserId(), null, cart.getTotalWithShip(), address, name, phone, email, note, "Đã thanh toán", "Ví", ship);
                    ud.updateAmount(a.getAmount() - cart.getTotalWithShip(), a.getUserId());
                    od.addOrder(o, a, cart);
                    Cookie c = new Cookie("cart", "");
                    c.setMaxAge(0);
                    response.addCookie(c);
                    User u = ud.searchByUName(a.getUsername());
                    session.setAttribute("account", u);
                    response.sendRedirect("shop");
                }
            } else {
                if (payment.equals("bank")) {
                    Order o = new Order(1, a.getUserId(), null, cart.getTotalWithShip(), address, name, phone, email, note, "Chờ xử lí", "Ngân hàng", ship);
                    od.addOrder(o, a, cart);
                    Cookie c = new Cookie("cart", "");
                    c.setMaxAge(0);
                    response.addCookie(c);
                    response.sendRedirect("shop");
                } else {
                    Order o = new Order(1, a.getUserId(), null, cart.getTotalWithShip(), address, name, phone, email, note, "Chờ xử lí", "COD", ship);
                    od.addOrder(o, a, cart);
                    Cookie c = new Cookie("cart", "");
                    c.setMaxAge(0);
                    response.addCookie(c);
                    response.sendRedirect("shop");
                }
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
