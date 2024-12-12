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
import model.Review;

/**
 *
 * @author ASUS
 */
public class ReviewDAO extends DBContext {

    public void addReview(Review r) {
        String sql = "INSERT INTO [dbo].[Reviews]\n"
                + "           ([ProductDetailID]\n"
                + "           ,[UserID]\n"
                + "           ,[Rating]\n"
                + "           ,[Comment])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, r.getProductDetailId());
            st.setInt(2, r.getUserId());
            st.setInt(3, r.getRating());
            st.setString(4, r.getComment());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Review> getReviewsByProductID(int productID) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews WHERE ProductDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review r = new Review(rs.getInt("id"), rs.getInt("ProductDetailID"), rs.getInt("UserID"), rs.getInt("Rating"), rs.getString("Comment"), rs.getDate("CreatedDate"));
                reviews.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> getAllAvgRating() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT AVG(Rating) AS avgRating, ProductDetailID\n"
                + "	FROM Reviews\n"
                + "	group by ProductDetailID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review r = new Review(0, rs.getInt("ProductDetailID"), 0, rs.getInt("avgRating"), "", null);
                reviews.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public int getAverageRating(int productID) {
        String sql = "SELECT AVG(Rating) AS avgRating\n"
                + "FROM Reviews\n"
                + "where ProductDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("avgRating");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {

        ReviewDAO r = new ReviewDAO();
        System.out.println(r.getAllAvgRating().get(0).getRating());
    }
}
