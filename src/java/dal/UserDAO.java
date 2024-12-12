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
import model.User;
import model.UserChart;

/**
 *
 * @author ASUS
 */
public class UserDAO extends DBContext {

    
    public User getById(int id) {
        String sql = "SELECT [UserID]\n"
                + "      ,[Email]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "      ,[Name]\n"
                + "      ,[amount]\n"
                + "      ,[createdDate]\n"
                + "      ,[Role]\n"
                + "  FROM [dbo].[Users] where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("name"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("address"), rs.getString("phone"), rs.getInt("amount"), rs.getInt("role"), rs.getDate("createdDate"));
                return u;
            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }
    
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "SELECT [UserID]\n"
                + "      ,[Email]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "      ,[Name]\n"
                + "      ,[amount]\n"
                + "      ,[createdDate]\n"
                + "      ,[Role]\n"
                + "  FROM [dbo].[Users]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("name"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("address"), rs.getString("phone"), rs.getInt("amount"), rs.getInt("role"), rs.getDate("createdDate"));
                list.add(u);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<User> getNew() {
        List<User> list = new ArrayList<>();
        //select from
        //String sql = "select * from Categories";
        //hoặc
        String sql = "select top 6 *\n"
                + "from Users\n"
                + "order by createdDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("name"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("address"), rs.getString("phone"), rs.getInt("amount"), rs.getInt("role"), rs.getDate("createdDate"));
                list.add(u);

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public void insert(User u) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([Name]\n"
                + "           ,[Email]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[Role])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getName());
            st.setString(2, u.getEmail());
            st.setString(3, u.getUsername());
            st.setString(4, u.getPassword());
            st.setString(5, u.getPhone());
            st.setString(6, u.getAddress());
            st.setInt(7, u.getRole());
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public User searchByUName(String username) {
        String sql = "select * from Users where Username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("name"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("address"), rs.getString("phone"), rs.getInt("amount"), rs.getInt("role"), rs.getDate("createdDate"));
                return u;

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return null;
    }

    public void updatePass(String password, String username) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Password] = ?\n"
                + " WHERE Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public int getAmount(int id) {
        String sql = "select amount\n"
                + "from Users\n"
                + "where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("amount");

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return 0;
    }

    public void updateAmount(int amount, int id) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [amount] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, amount);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public List<UserChart> getUserMonths() {
        List<UserChart> list = new ArrayList<>();
        list.add(new UserChart(1, 0));
        list.add(new UserChart(2, 0));
        list.add(new UserChart(3, 0));
        list.add(new UserChart(4, 0));
        list.add(new UserChart(5, 0));
        list.add(new UserChart(6, 0));
        list.add(new UserChart(7, 0));
        list.add(new UserChart(8, 0));
        list.add(new UserChart(9, 0));
        list.add(new UserChart(10, 0));
        list.add(new UserChart(11, 0));
        list.add(new UserChart(12, 0));

        String sql = "select MONTH(createdDate) month, count(UserID) num\n"
                + "from Users\n"
                + "where Role != 0\n"
                + "group by MONTH(createdDate)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserChart p = new UserChart(rs.getInt("month"), rs.getInt("num"));
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getMonth() == p.getMonth()) {
                        list.get(i).setNumOfUser(p.getNumOfUser());
                    }
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public void addAmount(int amount, int id) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [amount] = [amount] + ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, amount);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public void updateInfo(User a) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Username] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Name] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getEmail());
            st.setString(2, a.getUsername());
            st.setString(3, a.getPhone());
            st.setString(4, a.getAddress());
            st.setString(5, a.getName());
            st.setInt(6, a.getUserId());
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }
    
    public void editInfo(User a) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Username] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[amount] = ?\n"
                + "      ,[Role] = ?\n"
                + " WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getEmail());
            st.setString(2, a.getUsername());
            st.setString(3, a.getPhone());
            st.setString(4, a.getAddress());
            st.setString(5, a.getName());
            st.setInt(6, a.getAmount());
            st.setInt(7, a.getRole());
            st.setInt(8, a.getUserId());
            st.executeUpdate();
        } catch (SQLException s) {
            System.out.println(s);
        }
    }

    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        List<UserChart> list = d.getUserMonths();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getNumOfUser());
        }

    }
}
