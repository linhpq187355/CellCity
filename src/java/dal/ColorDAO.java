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
import model.Color;

/**
 *
 * @author ASUS
 */
public class ColorDAO extends DBContext {

    public List<Color> getAll() {
        List<Color> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Color]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color u = new Color(rs.getInt("id"), rs.getString("name"));
                list.add(u);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }
}
