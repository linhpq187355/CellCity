/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.SaleChart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class SaleChartDAO extends DBContext {

    public List<SaleChart> getSaleMonths() {
        List<SaleChart> list = new ArrayList<>();
        list.add(new SaleChart(1, 0));
        list.add(new SaleChart(2, 0));
        list.add(new SaleChart(3, 0));
        list.add(new SaleChart(4, 0));
        list.add(new SaleChart(5, 0));
        list.add(new SaleChart(6, 0));
        list.add(new SaleChart(7, 0));
        list.add(new SaleChart(8, 0));
        list.add(new SaleChart(9, 0));
        list.add(new SaleChart(10, 0));
        list.add(new SaleChart(11, 0));
        list.add(new SaleChart(12, 0));

        String sql = "select month(o.OrderDate) month, sum(o.TotalAmount) amount\n"
                + "from Orders o\n"
                + "where o.status != N'Đã hủy' and year(o.OrderDate) = Year(GETDATE())\n"
                + "group by month(o.OrderDate)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SaleChart p = new SaleChart(rs.getInt("month"), rs.getInt("amount"));
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getMonth() == p.getMonth()) {
                        list.get(i).setTotalSales(p.getTotalSales());
                    }
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }

    public List<SaleChart> getSaleWeeks() {
        List<SaleChart> list = new ArrayList<>();
        list.add(new SaleChart(1, 0));
        list.add(new SaleChart(2, 0));
        list.add(new SaleChart(3, 0));
        list.add(new SaleChart(4, 0));
        list.add(new SaleChart(5, 0));

        String sql = "SELECT \n"
                + "    DATEPART(WEEK, OrderDate) - DATEPART(WEEK, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)) + 1 AS WeekNumber,\n"
                + "    SUM(TotalAmount) AS TotalSales\n"
                + "FROM \n"
                + "    Orders\n"
                + "WHERE \n"
                + "    status != N'Đã hủy'\n"
                + "    AND YEAR(OrderDate) = YEAR(GETDATE())\n"
                + "    AND MONTH(OrderDate) = MONTH(GETDATE())\n"
                + "GROUP BY \n"
                + "    DATEPART(WEEK, OrderDate) - DATEPART(WEEK, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)) + 1\n"
                + "ORDER BY \n"
                + "    WeekNumber;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SaleChart p = new SaleChart(rs.getInt("WeekNumber"), rs.getInt("TotalSales"));
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getMonth() == p.getMonth()) {
                        list.get(i).setTotalSales(p.getTotalSales());
                    }
                }

            }
        } catch (SQLException s) {
            System.out.println(s);
        }
        return list;
    }
    
    public static void main(String[] args) {
        SaleChartDAO cd = new SaleChartDAO();
        List<SaleChart> list = cd.getSaleWeeks();
        System.out.println(list.get(0).getMonth());
    }
}
