/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.logging.Level;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class CategoryDAO extends DBContext {
    
    private static final Logger logger = Logger.getLogger(CategoryDAO.class.getName());

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        
        String sql = "SELECT [CategoryID]\n"
                + "      ,[CategoryName]\n"
                + "  FROM [dbo].[Categories]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category u = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"));
                list.add(u);

            }
        } catch (SQLException s) {
            logger.log(Level.SEVERE, "SQL Exception occurred in getAll", s);
        }
        return list;
    }

    public int countByCat(int id) {
        String sql = "select count(*) tong from ProductDetails pd\n"
                + "left join Products p on p.ProductID = pd.productID\n"
                + "left join Categories c on c.CategoryID = p.CategoryID\n"
                + "where c.CategoryID = ?\n"
                + "group by c.CategoryName";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int num = rs.getInt("tong");
                return num;
            }
        } catch (SQLException s) {
            logger.log(Level.SEVERE, "SQL Exception occurred in countByCat", s);
        }
        return 0;
    }
    
    
}
