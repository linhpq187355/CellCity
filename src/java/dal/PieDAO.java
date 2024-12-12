/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.PieChart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class PieDAO extends DBContext {

    public PieChart fetchDataFromDatabase(String catName, int id) {
        String sql = "select sum(od.Quantity) tong\n"
                + "from OrderDetails od\n"
                + "left join ProductDetails pd on pd.id = od.ProductID\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "left join Categories c on c.CategoryID = p.CategoryID\n"
                + "where c.CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PieChart p = new PieChart(catName, rs.getInt("tong"));
                return p;

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }
    
    public static void main(String[] args) {
        PieDAO pd = new PieDAO();
        PieChart p = pd.fetchDataFromDatabase("Nokia", 5);
        System.out.println(p.getValue());
    }
}
