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
import model.ImageProduct;

/**
 *
 * @author ASUS
 */
public class ImageProductDAO extends DBContext {

    public void insert(List<String> imageList, int pid) {
        String sql = "INSERT INTO [dbo].[ImageProduct]\n"
                + "           ([ProductID]\n"
                + "           ,[ImageUrl])\n"
                + "     VALUES\n"
                + "           (";
        for (int i = 0; i < imageList.size(); i++) {
            if (i < imageList.size() - 1) {
                sql += "?,?),(";
            } else {
                sql += "?,?)";
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int j = 1;
            for (int i = 0; i < imageList.size(); i++) {
                st.setInt(j, pid);
                st.setString(j + 1, imageList.get(i));
                j += 2;
            }

            st.executeUpdate();

        } catch (SQLException s) {
            System.out.println(s);
        }

    }

    public List<String> getAllByPid(int pid) {
        List<String> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select * from ImageProduct where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String link = rs.getString("ImageUrl");
                list.add(link);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }
    
    public List<ImageProduct> getImgByPid(int pid) {
        List<ImageProduct> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select * from ImageProduct where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ImageProduct ip = new ImageProduct(rs.getInt("productId"), rs.getString("ImageUrl"));
                list.add(ip);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public ImageProduct getFirstByPid(int pid) {
        String sql = "select top 1 * from ImageProduct where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ImageProduct ip = new ImageProduct(rs.getInt("productId"), rs.getString("ImageUrl"));
                return ip;
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }

    public List<ImageProduct> getFirstEachPid() {
        List<ImageProduct> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT ip.productId, ip.ImageUrl\n"
                + "FROM ImageProduct ip\n"
                + "WHERE id = (\n"
                + "    SELECT MIN(id)\n"
                + "    FROM ImageProduct\n"
                + "    WHERE productId = ip.productId\n"
                + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ImageProduct ip = new ImageProduct(rs.getInt("productId"),rs.getString("ImageUrl"));
                list.add(ip);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public void delete(String[] listimg) {
        String sql = "DELETE FROM [dbo].[ImageProduct]\n"
                + "      WHERE ImageUrl in (";
        for (int i = 0; i < listimg.length; i++) {
            if (i < listimg.length - 1) {
                sql += "?,";
            } else {
                sql += "?)";
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (int i = 0; i < listimg.length; i++) {
                st.setString(i + 1, listimg[i]);
            }
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }
}
