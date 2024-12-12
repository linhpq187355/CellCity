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
import model.ProductDetail;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class ProductDetailDAO extends DBContext {

    public List<ProductDetail> getAll() {
        List<ProductDetail> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [id]\n"
                + "      ,[ScreenTech]\n"
                + "      ,[RAM]\n"
                + "      ,[ROM]\n"
                + "      ,[FrontCam]\n"
                + "      ,[BackCam]\n"
                + "      ,[Battery]\n"
                + "      ,[OS]\n"
                + "      ,[SIM]\n"
                + "      ,[Chipset]\n"
                + "      ,[productID]\n"
                + "      ,[ScreenSize]\n"
                + "      ,[RefreshRate]\n"
                + "      ,[price]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[colorId]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[sale_start]\n"
                + "      ,[sale_end]\n"
                + "      ,[sale_price]\n"
                + "      ,[is_sale]\n"
                + "  FROM [dbo].[ProductDetails]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getAll(int id) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[ScreenTech]\n"
                + "      ,[RAM]\n"
                + "      ,[ROM]\n"
                + "      ,[FrontCam]\n"
                + "      ,[BackCam]\n"
                + "      ,[Battery]\n"
                + "      ,[OS]\n"
                + "      ,[SIM]\n"
                + "      ,[Chipset]\n"
                + "      ,[productID]\n"
                + "      ,[ScreenSize]\n"
                + "      ,[RefreshRate]\n"
                + "      ,[price]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[colorId]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[sale_start]\n"
                + "      ,[sale_end]\n"
                + "      ,[sale_price]\n"
                + "      ,[is_sale]\n"
                + "  FROM [dbo].[ProductDetails] where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getFirstByCid(int id) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "select *\n"
                + "from ProductDetails pd\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "left join Categories c on c.CategoryID = p.CategoryID\n"
                + "where c.CategoryID = ?\n"
                + "and pd.id = (\n"
                + "	SELECT MIN(pd2.id)\n"
                + "        FROM ProductDetails pd2\n"
                + "        WHERE pd2.ProductID = pd.ProductID\n"
                + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getAllRamrom(int id) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "SELECT distinct [RAM]\n"
                + "      ,[ROM]\n"
                + "      ,[productID]\n"
                + "  FROM [dbo].[ProductDetails] where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail u = new ProductDetail(0, "", rs.getInt("RAM"), rs.getInt("ROM"), "", "", 0, "", "", "", rs.getInt("productID"), 0, 0, 0, 0, 0, null, null, null, null, 0, 0);
                list.add(u);
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public ProductDetail getById(int id) {

        String sql = "SELECT [id]\n"
                + "      ,[ScreenTech]\n"
                + "      ,[RAM]\n"
                + "      ,[ROM]\n"
                + "      ,[FrontCam]\n"
                + "      ,[BackCam]\n"
                + "      ,[Battery]\n"
                + "      ,[OS]\n"
                + "      ,[SIM]\n"
                + "      ,[Chipset]\n"
                + "      ,[productID]\n"
                + "      ,[ScreenSize]\n"
                + "      ,[RefreshRate]\n"
                + "      ,[price]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[colorId]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[sale_start]\n"
                + "      ,[sale_end]\n"
                + "      ,[sale_price]\n"
                + "      ,[is_sale]\n"
                + "  FROM [dbo].[ProductDetails] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    return u;
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    return u;
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }

    public boolean insert(ProductDetail p) {
        String sql = "INSERT INTO [dbo].[ProductDetails]\n"
                + "           ([ScreenTech]\n"
                + "           ,[RAM]\n"
                + "           ,[ROM]\n"
                + "           ,[FrontCam]\n"
                + "           ,[BackCam]\n"
                + "           ,[Battery]\n"
                + "           ,[OS]\n"
                + "           ,[SIM]\n"
                + "           ,[Chipset]\n"
                + "           ,[productID]\n"
                + "           ,[ScreenSize]\n"
                + "           ,[RefreshRate]\n"
                + "           ,[price]\n"
                + "           ,[stockQuantity]\n"
                + "           ,[colorId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        boolean check=false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getScreenTech());
            st.setInt(2, p.getRam());
            st.setInt(3, p.getRom());
            st.setString(4, p.getFrontCam());
            st.setString(5, p.getBackCam());
            st.setInt(6, p.getBattery());
            st.setString(7, p.getOS());
            st.setString(8, p.getSim());
            st.setString(9, p.getChipset());
            st.setInt(10, p.getProductID());
            st.setFloat(11, p.getSreenSize());
            st.setInt(12, p.getRefreshRate());
            st.setInt(13, p.getPrice());
            st.setInt(14, p.getStockQuantity());
            st.setInt(15, p.getColorId());
            int rowAffected = st.executeUpdate();
            check = (rowAffected > 0);
            
        } catch (SQLException s) {
            System.out.println(s);
        }
        return check;
    }

    public boolean update(ProductDetail p) {
        String sql = "UPDATE [dbo].[ProductDetails]\n"
                + "   SET [ScreenTech] = ?\n"
                + "      ,[RAM] = ?\n"
                + "      ,[ROM] = ?\n"
                + "      ,[FrontCam] = ?\n"
                + "      ,[BackCam] = ?\n"
                + "      ,[Battery] = ?\n"
                + "      ,[OS] = ?\n"
                + "      ,[SIM] = ?\n"
                + "      ,[Chipset] = ?\n"
                + "      ,[productID] = ?\n"
                + "      ,[ScreenSize] = ?\n"
                + "      ,[RefreshRate] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[stockQuantity] = ?\n"
                + "      ,[colorId] = ?\n"
                + "      ,[LastUpdatedDate] = GETDATE()\n"
                + " WHERE id = ?";
        boolean check=false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getScreenTech());
            st.setInt(2, p.getRam());
            st.setInt(3, p.getRom());
            st.setString(4, p.getFrontCam());
            st.setString(5, p.getBackCam());
            st.setInt(6, p.getBattery());
            st.setString(7, p.getOS());
            st.setString(8, p.getSim());
            st.setString(9, p.getChipset());
            st.setInt(10, p.getProductID());
            st.setFloat(11, p.getSreenSize());
            st.setInt(12, p.getRefreshRate());
            st.setInt(13, p.getPrice());
            st.setInt(14, p.getStockQuantity());
            st.setInt(15, p.getColorId());
            st.setInt(16, p.getId());
            int rowAffected = st.executeUpdate();
            check = (rowAffected > 0);
        } catch (SQLException s) {
            System.out.println(s);
        }
        return check;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM [dbo].[ProductDetails]\n"
                + "      WHERE id = ?";
        boolean check = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            int rowAffected = st.executeUpdate();
            check = (rowAffected > 0);
        } catch (SQLException s) {
            System.out.println(s);
        }
        return check;
    }

    public boolean updatesale(ProductDetail p) {
        String sql = "UPDATE [dbo].[ProductDetails]\n"
                + "   SET [is_sale] = 1\n"
                + "      ,[sale_start] = ?\n"
                + "      ,[sale_end] = ?\n"
                + "      ,[sale_price] = ?"
                + " WHERE id = ?";
        boolean check = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, Timestamp.valueOf(p.getSale_start()));
            st.setTimestamp(2, Timestamp.valueOf(p.getSale_end()));
            st.setInt(3, p.getSale_price());
            st.setInt(4, p.getId());
            int rowAffected = st.executeUpdate();
            check = (rowAffected > 0);
        } catch (SQLException s) {
            System.out.println(s);
        }
        return check;
    }

    public void updateQuantity(int quan, int id) {
        String sql = "update ProductDetails\n"
                + "set stockQuantity = stockQuantity + ?\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quan);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public void updatesaleEnd() {
        String sql = "UPDATE [dbo].[ProductDetails]\n"
                + "   SET [is_sale] = 0\n"
                + "      ,[sale_start] = null\n"
                + "      ,[sale_end] = null\n"
                + "      ,[sale_price] = null"
                + " WHERE sale_end < GetDate() AND is_sale = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public List<ProductDetail> getAllSale() {
        List<ProductDetail> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [id]\n"
                + "      ,[ScreenTech]\n"
                + "      ,[RAM]\n"
                + "      ,[ROM]\n"
                + "      ,[FrontCam]\n"
                + "      ,[BackCam]\n"
                + "      ,[Battery]\n"
                + "      ,[OS]\n"
                + "      ,[SIM]\n"
                + "      ,[Chipset]\n"
                + "      ,[productID]\n"
                + "      ,[ScreenSize]\n"
                + "      ,[RefreshRate]\n"
                + "      ,[price]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[colorId]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[LastUpdatedDate]\n"
                + "      ,[sale_start]\n"
                + "      ,[sale_end]\n"
                + "      ,[sale_price]\n"
                + "      ,[is_sale]\n"
                + "  FROM [dbo].[ProductDetails] where is_sale = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public int getAllQuan() {

        String sql = "select sum(stockQuantity) soluong\n"
                + "from ProductDetails";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("soluong");
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return 0;
    }

    public int getDoanhthu() {

        String sql = "select sum(TotalAmount) doanhthu\n"
                + "from Orders\n"
                + "where status = N'Hoàn thành'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("doanhthu");
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return 0;
    }

    public List<ProductDetail> getAllTopSale() {
        List<ProductDetail> list = new ArrayList<>();
        List<Integer> listProid = new ArrayList<>();
        String sql = "select top 8 ProductID, sum(Quantity) tong\n"
                + "from OrderDetails\n"
                + "group by ProductID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listProid.add(rs.getInt("ProductID"));
            }
            String sql1 = "SELECT [id]\n"
                    + "      ,[ScreenTech]\n"
                    + "      ,[RAM]\n"
                    + "      ,[ROM]\n"
                    + "      ,[FrontCam]\n"
                    + "      ,[BackCam]\n"
                    + "      ,[Battery]\n"
                    + "      ,[OS]\n"
                    + "      ,[SIM]\n"
                    + "      ,[Chipset]\n"
                    + "      ,[productID]\n"
                    + "      ,[ScreenSize]\n"
                    + "      ,[RefreshRate]\n"
                    + "      ,[price]\n"
                    + "      ,[stockQuantity]\n"
                    + "      ,[colorId]\n"
                    + "      ,[CreatedDate]\n"
                    + "      ,[LastUpdatedDate]\n"
                    + "      ,[sale_start]\n"
                    + "      ,[sale_end]\n"
                    + "      ,[sale_price]\n"
                    + "      ,[is_sale]\n"
                    + "  FROM [dbo].[ProductDetails] where id in (";
            for (int i = 0; i < listProid.size(); i++) {
                if (i < listProid.size() - 1) {
                    sql1 += "?,";
                } else {
                    sql1 += "?)";
                }
            }
            PreparedStatement st1 = connection.prepareStatement(sql1);
            for (int i = 0; i < listProid.size(); i++) {
                st1.setInt(i + 1, listProid.get(i));
            }
            ResultSet rs1 = st1.executeQuery();
            while (rs1.next()) {
                if (rs1.getTimestamp("sale_start") != null && rs1.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs1.getInt("id"), rs1.getString("ScreenTech"), rs1.getInt("RAM"), rs1.getInt("ROM"), rs1.getString("FrontCam"), rs1.getString("BackCam"), rs1.getInt("Battery"), rs1.getString("OS"), rs1.getString("SIM"), rs1.getString("Chipset"), rs1.getInt("productID"), rs1.getFloat("ScreenSize"), rs1.getInt("RefreshRate"), rs1.getInt("price"), rs1.getInt("stockQuantity"), rs1.getInt("colorId"), rs1.getDate("CreatedDate"), rs1.getDate("LastUpdatedDate"), rs1.getTimestamp("sale_start").toLocalDateTime(), rs1.getTimestamp("sale_end").toLocalDateTime(), rs1.getInt("sale_price"), rs1.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs1.getInt("id"), rs1.getString("ScreenTech"), rs1.getInt("RAM"), rs1.getInt("ROM"), rs1.getString("FrontCam"), rs1.getString("BackCam"), rs1.getInt("Battery"), rs1.getString("OS"), rs1.getString("SIM"), rs1.getString("Chipset"), rs1.getInt("productID"), rs1.getFloat("ScreenSize"), rs1.getInt("RefreshRate"), rs1.getInt("price"), rs1.getInt("stockQuantity"), rs1.getInt("colorId"), rs1.getDate("CreatedDate"), rs1.getDate("LastUpdatedDate"), null, null, rs1.getInt("sale_price"), rs1.getInt("is_sale"));
                    list.add(u);
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getAllTopRating() {
        List<ProductDetail> list = new ArrayList<>();
        List<Integer> listProid = new ArrayList<>();
        String sql = "SELECT top 8 AVG(Rating) AS avgRating, ProductDetailID\n"
                + "	FROM Reviews\n"
                + "	group by ProductDetailID\n"
                + "	having AVG(Rating) >= 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listProid.add(rs.getInt("ProductDetailID"));
            }
            String sql1 = "SELECT [id]\n"
                    + "      ,[ScreenTech]\n"
                    + "      ,[RAM]\n"
                    + "      ,[ROM]\n"
                    + "      ,[FrontCam]\n"
                    + "      ,[BackCam]\n"
                    + "      ,[Battery]\n"
                    + "      ,[OS]\n"
                    + "      ,[SIM]\n"
                    + "      ,[Chipset]\n"
                    + "      ,[productID]\n"
                    + "      ,[ScreenSize]\n"
                    + "      ,[RefreshRate]\n"
                    + "      ,[price]\n"
                    + "      ,[stockQuantity]\n"
                    + "      ,[colorId]\n"
                    + "      ,[CreatedDate]\n"
                    + "      ,[LastUpdatedDate]\n"
                    + "      ,[sale_start]\n"
                    + "      ,[sale_end]\n"
                    + "      ,[sale_price]\n"
                    + "      ,[is_sale]\n"
                    + "  FROM [dbo].[ProductDetails] where id in (";
            for (int i = 0; i < listProid.size(); i++) {
                if (i < listProid.size() - 1) {
                    sql1 += "?,";
                } else {
                    sql1 += "?)";
                }
            }
            PreparedStatement st1 = connection.prepareStatement(sql1);
            for (int i = 0; i < listProid.size(); i++) {
                st1.setInt(i + 1, listProid.get(i));
            }
            ResultSet rs1 = st1.executeQuery();
            while (rs1.next()) {
                if (rs1.getTimestamp("sale_start") != null && rs1.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs1.getInt("id"), rs1.getString("ScreenTech"), rs1.getInt("RAM"), rs1.getInt("ROM"), rs1.getString("FrontCam"), rs1.getString("BackCam"), rs1.getInt("Battery"), rs1.getString("OS"), rs1.getString("SIM"), rs1.getString("Chipset"), rs1.getInt("productID"), rs1.getFloat("ScreenSize"), rs1.getInt("RefreshRate"), rs1.getInt("price"), rs1.getInt("stockQuantity"), rs1.getInt("colorId"), rs1.getDate("CreatedDate"), rs1.getDate("LastUpdatedDate"), rs1.getTimestamp("sale_start").toLocalDateTime(), rs1.getTimestamp("sale_end").toLocalDateTime(), rs1.getInt("sale_price"), rs1.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs1.getInt("id"), rs1.getString("ScreenTech"), rs1.getInt("RAM"), rs1.getInt("ROM"), rs1.getString("FrontCam"), rs1.getString("BackCam"), rs1.getInt("Battery"), rs1.getString("OS"), rs1.getString("SIM"), rs1.getString("Chipset"), rs1.getInt("productID"), rs1.getFloat("ScreenSize"), rs1.getInt("RefreshRate"), rs1.getInt("price"), rs1.getInt("stockQuantity"), rs1.getInt("colorId"), rs1.getDate("CreatedDate"), rs1.getDate("LastUpdatedDate"), null, null, rs1.getInt("sale_price"), rs1.getInt("is_sale"));
                    list.add(u);
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getNewPro(int catid) {
        List<ProductDetail> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select top 6 *\n"
                + "from ProductDetails pd\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "where p.CategoryID = ?\n"
                + "order by pd.CreatedDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, catid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getAllNewPro() {
        List<ProductDetail> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select top 10 *\n"
                + "from ProductDetails pd\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "order by pd.CreatedDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getAllByCat(int[] id) {
        List<ProductDetail> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select pd.BackCam,pd.Battery,pd.Chipset,pd.colorId,pd.CreatedDate,pd.FrontCam,pd.id,pd.is_sale,pd.LastUpdatedDate,pd.OS,pd.price,pd.productID,pd.RAM,pd.RefreshRate,pd.ROM,pd.sale_end,pd.sale_price,pd.sale_start,pd.ScreenSize,pd.ScreenTech,pd.SIM,pd.stockQuantity from ProductDetails pd\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "left join Categories c on c.CategoryID = p.CategoryID\n"
                + "where c.CategoryID in (";
        for (int i = 0; i < id.length; i++) {
            if (i < id.length - 1) {
                sql += id[i] + ",";
            } else {
                sql += id[i] + ")";
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<ProductDetail> getAllByFilter(Map<String, String> filters) {
        List<ProductDetail> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("select pd.BackCam,pd.Battery,pd.Chipset,pd.colorId,pd.CreatedDate,pd.FrontCam,pd.id,pd.is_sale,pd.LastUpdatedDate,pd.OS,pd.price,pd.productID,pd.RAM,pd.RefreshRate,pd.ROM,pd.sale_end,pd.sale_price,pd.sale_start,pd.ScreenSize,pd.ScreenTech,pd.SIM,pd.stockQuantity from ProductDetails pd\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "left join Categories c on c.CategoryID = p.CategoryID\n"
                + "where 1=1");
        String orderByClause = "";
        for (Map.Entry<String, String> entry : filters.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();

            /*if (key.equals("category")) {
                // Handle categoryId values
                sql.append(" AND c.CategoryID IN (");
                String[] categoryIds = value.split(",");
                for (int i = 0; i < categoryIds.length; i++) {
                    if (i > 0) {
                        sql.append(",");
                    }
                    sql.append("?");
                }
                sql.append(")");
            } else if ("minPrice".equals(key)) {
                sql.append(" AND price >= ?");
            } else if ("maxPrice".equals(key)) {
                sql.append(" AND price <= ?");
            } else if ("chipset".equals(key)) {
                sql.append(" AND (");
                String[] chiplist = value.split(",");
                for (int i = 0; i < chiplist.length; i++) {
                    if (i > 0) {
                        sql.append(" OR ");
                    }
                    sql.append("pd.Chipset LIKE ?");
                }
                sql.append(")");
            } else if ("screenSize".equals(key)) {
                sql.append(" AND (");
                String[] scrsizeList = value.split(",");
                for (int i = 0; i < scrsizeList.length; i++) {
                    if (i > 0) {
                        sql.append(" OR ");
                    }
                    if (scrsizeList[i].equals("1")) {
                        sql.append("pd.ScreenSize < 6");
                    }
                    if (scrsizeList[i].equals("2")) {
                        sql.append("pd.ScreenSize between 6 and 6.5");
                    }
                    if (scrsizeList[i].equals("3")) {
                        sql.append("pd.ScreenSize > 6.5");
                    }

                }
                sql.append(")");
            } else if ("sortby".equals(key)) {
                sql.append("\norder by ");
                if (value.equals("new")) {
                    sql.append("pd.CreatedDate desc");
                } else {
                    if (value.equals("price-high")) {
                        sql.append("pd.price desc");
                    } else {
                        if (value.equals("price-low")) {
                            sql.append("pd.price");
                        }
                    }
                }

            }*/
            switch (key) {
                case "category":
                    sql.append(" AND c.CategoryID IN (");
                    String[] categoryIds = value.split(",");
                    for (int i = 0; i < categoryIds.length; i++) {
                        if (i > 0) {
                            sql.append(",");
                        }
                        sql.append("?");

                    }
                    sql.append(")");
                    break;
                case "minPrice":
                    sql.append(" AND pd.price >= ?");

                    break;
                case "maxPrice":
                    sql.append(" AND pd.price <= ?");

                    break;
                case "chipset":
                    sql.append(" AND (");
                    String[] chiplist = value.split(",");
                    for (int i = 0; i < chiplist.length; i++) {
                        if (i > 0) {
                            sql.append(" OR ");
                        }
                        sql.append("pd.Chipset LIKE ?");

                    }
                    sql.append(")");
                    break;
                case "screenSize":
                    sql.append(" AND (");
                    String[] scrsizeList = value.split(",");
                    for (int i = 0; i < scrsizeList.length; i++) {
                        if (i > 0) {
                            sql.append(" OR ");
                        }
                        switch (scrsizeList[i]) {
                            case "1":
                                sql.append("pd.ScreenSize < 6");
                                break;
                            case "2":
                                sql.append("pd.ScreenSize BETWEEN 6 AND 6.5");
                                break;
                            case "3":
                                sql.append("pd.ScreenSize > 6.5");
                                break;
                        }
                    }
                    sql.append(")");
                    break;
                case "sortby":
                    orderByClause = " ORDER BY ";
                    switch (value) {
                        case "new":
                            orderByClause += "pd.CreatedDate DESC";
                            break;
                        case "price-high":
                            orderByClause += "pd.price DESC";
                            break;
                        case "price-low":
                            orderByClause += "pd.price ASC";
                            break;
                    }
                    break;
                case "search":
                    sql.append(" AND p.Name like ?");
                    break;
                // Add more conditions as needed
            }
            // Add more conditions as needed
        }
        if (!orderByClause.isEmpty()) {
            sql.append(orderByClause);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            int index = 1;
            // Set parameters in PreparedStatement based on filters Map
            for (Map.Entry<String, String> entry : filters.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();

                if (key.startsWith("category")) {
                    // Handle categoryId values
                    String[] categoryIds = value.split(",");
                    for (String categoryId : categoryIds) {
                        st.setString(index++, categoryId.trim());
                    }
                } else if ("minPrice".equals(key) || "maxPrice".equals(key)) {
                    st.setDouble(index++, Double.parseDouble(value));
                } else if ("chipset".equals(key)) {
                    String[] chiplists = value.split(",");
                    for (String chiplist : chiplists) {
                        st.setString(index++, "%" + chiplist.trim() + "%");
                    }
                } else if ("search".equals(key)) {
                    String[] chiplists = value.split(" ");
                    String s = "%";
                    for (int i = 0; i < chiplists.length; i++) {

                        s += chiplists[i] + "%";

                    }
                    st.setString(index++, s);

                }
                // Set more parameters as needed
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getTimestamp("sale_start") != null && rs.getTimestamp("sale_end") != null) {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), rs.getTimestamp("sale_start").toLocalDateTime(), rs.getTimestamp("sale_end").toLocalDateTime(), rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                } else {
                    ProductDetail u = new ProductDetail(rs.getInt("id"), rs.getString("ScreenTech"), rs.getInt("RAM"), rs.getInt("ROM"), rs.getString("FrontCam"), rs.getString("BackCam"), rs.getInt("Battery"), rs.getString("OS"), rs.getString("SIM"), rs.getString("Chipset"), rs.getInt("productID"), rs.getFloat("ScreenSize"), rs.getInt("RefreshRate"), rs.getInt("price"), rs.getInt("stockQuantity"), rs.getInt("colorId"), rs.getDate("CreatedDate"), rs.getDate("LastUpdatedDate"), null, null, rs.getInt("sale_price"), rs.getInt("is_sale"));
                    list.add(u);
                }
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public static void main(String[] args) {
        Map<String, String> filters = new HashMap<>();
        filters.put("search", "samsung s24");
        ProductDetailDAO d = new ProductDetailDAO();
        List<ProductDetail> l = d.getAllByFilter(filters);
        System.out.println(l.get(0).getId());
    }
}
