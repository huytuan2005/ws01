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
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import model.DTO.Product;

/**
 *
 * @author phuct
 */
public class ProductDAO implements Acccessible<Product>{
    private ServletContext sc;

    public ProductDAO() {
    }

    public ProductDAO(ServletContext sc) {
        this.sc = sc;
    }
    
    private Connection getConnetion() throws SQLException, ClassNotFoundException{
        ConnectDB db = new ConnectDB(sc);
        return db.getConnection();
    }
    
    @Override
    public int insertRec(Product pd) {
       String sql = "insert into products(productId, productName, productImage, brief, account, price, discount, typeId, unit) values(?,?,?,?,?,?,?,?,?)";
        try {
            Connection cnn =getConnetion();
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, pd.getProductId());
            ps.setString(2, pd.getProductName());
            ps.setString(3, pd.getProductImage());
            ps.setString(4, pd.getGetBrief());
            ps.setString(5, pd.getAccount());
            ps.setInt(6, pd.getPrice());
            ps.setInt(7, pd.getDiscount());
            ps.setInt(8, pd.getTypeId());
            ps.setString(9, pd.getUnit());
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteRec(String id) {
        String sql = "delete products where productId = ?";
        try {
            Connection cnn = getConnetion();
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, id);
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateRec(Product pd) {
        String sql = "update products set  productName = ?, productImage = ?, brief = ?, account = ?, price = ?, discount = ?, typeId = ?, unit = ? where productId = ?";
        try {
            Connection cnn = getConnetion();
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, pd.getProductName());
            ps.setString(2, pd.getProductImage());
            ps.setString(3, pd.getGetBrief());
            ps.setString(4, pd.getAccount());
            ps.setInt(5, pd.getPrice());
            ps.setInt(6, pd.getDiscount());
            ps.setInt(7, pd.getTypeId());
            ps.setString(8, pd.getUnit());
            ps.setString(9, pd.getProductId());
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Product getObjectById(String id) {
        String sql = "select * from products where productId = ?";
        try {
            Connection cnn = getConnetion();
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String getBrief = rs.getString("brief");
                Date postDate = rs.getDate("postedDate");
                int typeId=rs.getInt("typeId");
                String account = rs.getString("account");
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");
                return new Product(productId, productName, productImage, getBrief, postDate, typeId, account, unit, price, discount);
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Product> listAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select*from products";
        try {
            Connection cnn = getConnetion();
            PreparedStatement ps = cnn.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
            String productId = rs.getString("productId");
            String productName = rs.getString("productName");
            String productImage = rs.getString("productImage");
            String getBrief = rs.getString("brief");
            Date postDate = rs.getDate("postedDate");
            int typeId=rs.getInt("typeId");
            String account = rs.getString("account");
            String unit = rs.getString("unit");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            list.add (new Product(productId, productName, productImage, getBrief, postDate, typeId, account, unit, price, discount));
            } 
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
