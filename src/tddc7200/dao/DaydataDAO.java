package tddc7200.dao;
import tdc7200.bean.Daydata;
import tdc7200.bean.User;
import tdc7200.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class DaydataDAO {
    public int getTotal() {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {

            String sql = "select count(*) from Daydata";

            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return total;
    }
    public int getTotal(int uid) {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {

            String sql = "select count(*) from Review where uid = " + uid;

            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return total;
    }
    public void add(Daydata bean) {

        String sql = "insert into Daydata values(null,?,?,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, bean.getUser().getId());
            ps.setInt(2, bean.getDay());
            ps.setInt(3, bean.getMonth());
            ps.setInt(4, bean.getYear_());
            ps.setFloat(5, bean.getData());

            ps.execute();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
    public Daydata get(int id) {
        Daydata bean = new Daydata();

        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {

            String sql = "select * from Daydata where id = " + id;

            ResultSet rs = s.executeQuery(sql);

            if (rs.next()) {
                int uid = rs.getInt("uid");
                int day=rs.getInt("day");
                int month=rs.getInt("month");
                int year_=rs.getInt("year_");
                float data=rs.getFloat("data");


                User user = new UserDAO().get(uid);

                bean.setData(data);
                bean.setDay(day);
                bean.setMonth(month);
                bean.setYear_(year_);
                bean.setUser(user);
                bean.setId(id);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return bean;
    }
    //看指定用户的所有数据
    public List<Daydata> list(int uid) {
        return list(uid, 0, Short.MAX_VALUE);
    }
    //指定用户有多少数据
    public int getCount(int uid) {
        String sql = "select count(*) from Review where uid = ? ";

        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return 0;
    }

    public List<Daydata> list(int uid, int start, int count) {
        List<Daydata> beans = new ArrayList<Daydata>();

        String sql = "select * from Review where uid = ? order by id desc limit ?,? ";

        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, uid);
            ps.setInt(2, start);
            ps.setInt(3, count);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Daydata bean = new Daydata();
                int id = rs.getInt(1);
                int day=rs.getInt("day");
                int month=rs.getInt("month");
                int year_=rs.getInt("year_");
                float data=rs.getFloat("data");
                User user = new UserDAO().get(uid);

                bean.setYear_(year_);
                bean.setMonth(month);
                bean.setDay(day);
                bean.setId(id);
                bean.setUser(user);
                bean.setData(data);
                beans.add(bean);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return beans;
    }
}
