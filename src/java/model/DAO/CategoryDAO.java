/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import model.DTO.Category;

/**
 *
 * @author phuct
 */
public class CategoryDAO implements Acccessible<Category> {
    private ServletContext sc;

    public CategoryDAO() {
    }

    public CategoryDAO(ServletContext sc) {
        this.sc = sc;
    }
    public Connection getConnection(ServletContext sc) throws SQLException, ClassNotFoundException{
        ConnectDB db = new ConnectDB(sc);
        return db.getConnection();
    }

    @Override
    public int insertRec(Category ct) {
        String sql = "insert into categories( categoryName, memo) values (?,?)";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, ct.getCategoryName());
            ps.setString(2,ct.getMemo());
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteRec(String id) {
        String sql = "delete categories where typeId = ?";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, id);
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
        
    }

    @Override
    public int updateRec(Category ct) {
        String sql = "update categories set categoryName = ?, memo = ?  where typeId = ?";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            
            ps.setString(1, ct.getCategoryName());
            ps.setString(2,ct.getMemo());
            ps.setInt(3, ct.getTypeId());
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Category getObjectById(String id) {
        String sql = "select * from categories where typeId = ?";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
             ResultSet rs = ps.executeQuery();
             if(rs.next()){
                 int typeId = rs.getInt("typeId");
                 String categoryName = rs.getString("categoryName");
                 String memo = rs.getString("memo");
                 return new Category(typeId, categoryName, memo);
             }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Category> listAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select* from categories";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                int typeId = rs.getInt("typeId");
                String categoryName = rs.getString("categoryName");
                String memo = rs.getString("memo");
                Category ct = new Category(typeId, categoryName, memo);
                list.add(ct);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
