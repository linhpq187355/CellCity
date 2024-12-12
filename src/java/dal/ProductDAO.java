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
import model.Product;
import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class ProductDAO extends DBContext {

    /*public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [ProductID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "      ,[Price]\n"
                + "      ,[CategoryID]\n"
                + "      ,[StockQuantity]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[WarrantyPeriod]\n"
                + "      ,[Type]\n"
                + "      ,[Technology]\n"
                + "      ,[dimension]\n"
                + "      ,[Utility]\n"
                + "      ,[Manufacturing_location]\n"
                + "  FROM [dbo].[Products]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product(rs.getInt("ProductID"), rs.getString("Name"), rs.getString("Description"), rs.getInt("Price"), rs.getInt("CategoryID"), rs.getInt("StockQuantity"), rs.getString("WarrantyPeriod"), rs.getString("type"), rs.getString("technology"), rs.getString("dimension"), rs.getString("utility"), rs.getString("manufacturing_location"), rs.getDate("CreatedDate"), rs.getDate("lastUpdatedDate"));
                list.add(u);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public int insert(Product c) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([Name]\n"
                + "           ,[Description]\n"
                + "           ,[Price]\n"
                + "           ,[CategoryID]\n"
                + "           ,[StockQuantity]\n"
                + "           ,[WarrantyPeriod]\n"
                + "           ,[Type]\n"
                + "           ,[Technology]\n"
                + "           ,[dimension]\n"
                + "           ,[Utility]\n"
                + "           ,[Manufacturing_location])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?)";
        int productId = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            st.setString(1, c.getName());
            st.setString(2, c.getDescription());
            st.setInt(3, c.getPrice());
            st.setInt(4, c.getCategoryId());
            st.setInt(5, c.getStockQuantity());
            st.setString(6, c.getWarrantyPeriod());
            st.setString(7, c.getType());
            st.setString(8, c.getTech());
            st.setString(9, c.getDimension());
            st.setString(10, c.getUtility());
            st.setString(11, c.getManufac_loca());
            int row = st.executeUpdate();
            if (row > 0) {
                ResultSet generatedKeys = st.getGeneratedKeys();
                if (generatedKeys.next()) {
                    productId = generatedKeys.getInt(1);
                }
            }

        } catch (SQLException s) {
            System.out.println(s);
        }
        return productId;
    }
    
    public List<Product> getAllById(int id) {
        List<Product> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [ProductID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "      ,[Price]\n"
                + "      ,[CategoryID]\n"
                + "      ,[StockQuantity]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[WarrantyPeriod]\n"
                + "      ,[Type]\n"
                + "      ,[Technology]\n"
                + "      ,[dimension]\n"
                + "      ,[Utility]\n"
                + "      ,[Manufacturing_location]\n"
                + "  FROM [dbo].[Products] where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product(rs.getInt("ProductID"), rs.getString("Name"), rs.getString("Description"), rs.getInt("Price"), rs.getInt("CategoryID"), rs.getInt("StockQuantity"), rs.getString("WarrantyPeriod"), rs.getString("type"), rs.getString("technology"), rs.getString("dimension"), rs.getString("utility"), rs.getString("manufacturing_location"), rs.getDate("CreatedDate"), rs.getDate("lastUpdatedDate"));
                list.add(u);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }
    
    public Product getById(int id) {

        String sql = "SELECT [ProductID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "      ,[Price]\n"
                + "      ,[CategoryID]\n"
                + "      ,[StockQuantity]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[WarrantyPeriod]\n"
                + "      ,[Type]\n"
                + "      ,[Technology]\n"
                + "      ,[dimension]\n"
                + "      ,[Utility]\n"
                + "      ,[Manufacturing_location]\n"
                + "  FROM [dbo].[Products] where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product(rs.getInt("ProductID"), rs.getString("Name"), rs.getString("Description"), rs.getInt("Price"), rs.getInt("CategoryID"), rs.getInt("StockQuantity"), rs.getString("WarrantyPeriod"), rs.getString("type"), rs.getString("technology"), rs.getString("dimension"), rs.getString("utility"), rs.getString("manufacturing_location"), rs.getDate("CreatedDate"), rs.getDate("lastUpdatedDate"));
                return u;
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }*/
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [ProductID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "      ,[CategoryID]\n"
                + "      ,[WarrantyPeriod]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "  FROM [dbo].[Products]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product(rs.getInt("ProductID"), rs.getString("Name"), rs.getString("Description"), rs.getInt("CategoryID"), rs.getString("WarrantyPeriod"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"));
                list.add(u);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public Product getById(int id) {
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [ProductID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "      ,[CategoryID]\n"
                + "      ,[WarrantyPeriod]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "  FROM [dbo].[Products] where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product(rs.getInt("ProductID"), rs.getString("Name"), rs.getString("Description"), rs.getInt("CategoryID"), rs.getString("WarrantyPeriod"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"));
                return u;

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }

    public int insert(Product c) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([Name]\n"
                + "           ,[Description]\n"
                + "           ,[CategoryID]\n"
                + "           ,[WarrantyPeriod])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        int productId = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setString(1, c.getName());
            st.setString(2, c.getDescription());
            st.setInt(3, c.getCategoryId());
            st.setString(4, c.getWarrantyPeriod());
            int row = st.executeUpdate();
            if (row > 0) {
                ResultSet generatedKeys = st.getGeneratedKeys();
                if (generatedKeys.next()) {
                    productId = generatedKeys.getInt(1);
                }
            }

        } catch (SQLException s) {
            System.out.println(s);
        }
        return productId;
    }

    public void update(Product p) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[WarrantyPeriod] = ?\n"
                + "      ,[LastUpdatedDate] = GETDATE()\n"
                + " WHERE ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getDescription());
            st.setInt(3, p.getCategoryId());
            st.setString(4, p.getWarrantyPeriod());
            st.setInt(5, p.getProductId());
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }
    
    public boolean delete(int id) {
        String sql = "DELETE FROM [dbo].[ProductDetails]\n"
                + "      WHERE productID = ?";
        boolean check = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            String sql1 = "DELETE FROM [dbo].[ImageProduct]\n"
                + "      WHERE productId = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.executeUpdate();
            String sql2 = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE ProductID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, id);
            int row = st2.executeUpdate();
            check = (row>0);
        } catch (SQLException s) {
            System.out.println(s);
        }
        return check;
    }

    public static void main(String[] args) {
        ProductDAO u = new ProductDAO();
        List<Product> l = u.getAll();
        System.out.println(l.get(0).getName());
    }
}
