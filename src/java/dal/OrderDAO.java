/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Order;
import model.User;

/**
 *
 * @author ASUS
 */
public class OrderDAO extends DBContext {

    public void addOrder(Order od, User u, Cart cart) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([UserID]\n"
                + "           ,[OrderDate]\n"
                + "           ,[TotalAmount]\n"
                + "           ,[ShipAddress]\n"
                + "           ,[shipping_name]\n"
                + "           ,[shipping_phone]\n"
                + "           ,[shipping_email]\n"
                + "           ,[shipping_note]\n"
                + "           ,[payment]\n"
                + "           ,[shippingFee]\n"
                + "           ,[status])"
                + "     VALUES\n"
                + "           (?,GETDATE(),?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getUserId());
            st.setInt(2, cart.getTotalWithShip());
            st.setString(3, od.getShipAddress());
            st.setString(4, od.getShipping_name());
            st.setString(5, od.getShipping_phone());
            st.setString(6, od.getShipping_email());
            st.setString(7, od.getShipping_note());
            st.setString(8, od.getPayment());
            st.setInt(9, od.getShippingFee());
            st.setString(10, od.getStatus());
            st.executeUpdate();
            String sql1 = "select top 1 OrderID from Orders order by OrderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("OrderID");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetails]\n"
                            + "           ([OrderID]\n"
                            + "           ,[Quantity]\n"
                            + "           ,[Price]\n"
                            + "           ,[ProductID])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getQuantity());
                    st2.setInt(3, i.getPrice());
                    st2.setInt(4, i.getProduct().getId());
                    st2.executeUpdate();
                }
            }
            String sql3 = "update ProductDetails\n"
                    + "set stockQuantity = stockQuantity - ?\n"
                    + "where id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public List<Order> getOrderByUser(int id) {
        List<Order> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select *\n"
                + "from Orders\n"
                + "where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"), rs.getInt("UserID"), rs.getDate("OrderDate"), rs.getInt("TotalAmount"), rs.getString("ShipAddress"), rs.getString("shipping_name"), rs.getString("shipping_phone"), rs.getString("shipping_email"), rs.getString("shipping_note"), rs.getString("status"), rs.getString("payment"), rs.getInt("shippingFee"));
                list.add(o);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public Order getOrderById(int id) {
        String sql = "select *\n"
                + "from Orders\n"
                + "where OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"), rs.getInt("UserID"), rs.getDate("OrderDate"), rs.getInt("TotalAmount"), rs.getString("ShipAddress"), rs.getString("shipping_name"), rs.getString("shipping_phone"), rs.getString("shipping_email"), rs.getString("shipping_note"), rs.getString("status"), rs.getString("payment"), rs.getInt("shippingFee"));
                return o;

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from Orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"), rs.getInt("UserID"), rs.getDate("OrderDate"), rs.getInt("TotalAmount"), rs.getString("ShipAddress"), rs.getString("shipping_name"), rs.getString("shipping_phone"), rs.getString("shipping_email"), rs.getString("shipping_note"), rs.getString("status"), rs.getString("payment"), rs.getInt("shippingFee"));
                list.add(o);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<Order> getAllNewOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select top 7 *\n"
                + "from Orders\n"
                + "order by OrderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"), rs.getInt("UserID"), rs.getDate("OrderDate"), rs.getInt("TotalAmount"), rs.getString("ShipAddress"), rs.getString("shipping_name"), rs.getString("shipping_phone"), rs.getString("shipping_email"), rs.getString("shipping_note"), rs.getString("status"), rs.getString("payment"), rs.getInt("shippingFee"));
                list.add(o);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public void cancelOrder(int id) {
        String sql = "update Orders\n"
                + "set status = ?\n"
                + "where OrderID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "Đã hủy");
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public void updateStatus(int id, String status) {
        String sql = "update Orders\n"
                + "set status = ?\n"
                + "where OrderID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

}
