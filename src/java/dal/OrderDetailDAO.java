/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class OrderDetailDAO extends DBContext{

    public List<OrderDetail> getAllByOId(int id) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT [OrderDetailID]\n"
                + "      ,[OrderID]\n"
                + "      ,[Quantity]\n"
                + "      ,[Price]\n"
                + "      ,[ProductID]\n"
                + "  FROM [dbo].[OrderDetails] where OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail(rs.getInt("OrderDetailID"),rs.getInt("OrderID"),rs.getInt("ProductID"),rs.getInt("Quantity"),rs.getInt("Price"));
                list.add(o);
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }
}
