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
import model.DTO.Account;

/**
 *
 * @author phuct
 */
public class AccountDAO implements Acccessible<Account>{
    private ServletContext sc;

    public AccountDAO(){
    }

    public AccountDAO(ServletContext sc){
        this.sc = sc;
    }
    
    private Connection getConnection(ServletContext sc) throws SQLException, ClassNotFoundException{
        ConnectDB db = new ConnectDB(sc);
        return db.getConnection();
    }
    @Override
    public int insertRec(Account ac) {
        String sql = "insert into accounts(account,pass,lastName,firstName,birthday,gender,phone,isUse,roleInSystem) values (?,?,?,?,?,?,?,?,?)";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1,ac.getAccount());
            ps.setString(2, ac.getFirstName());
            ps.setString(3, ac.getLastName());
            ps.setString(4, ac.getPass());
            ps.setDate(5, (java.sql.Date) ac.getBirthday());
            ps.setBoolean(6, ac.isGender());
            ps.setString(7, ac.getPhone());
            ps.setBoolean(8, ac.isIsUse());
            ps.setInt(9, ac.getRoleInSystem());
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateRec(Account ac) {
        String sql = "update accounts set pass = ?, lastName = ?, firstName = ?, birthday = ?, gender = ?, phone = ?, isUse = ?, roleInSystem = ? where account = ?";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, ac.getPass());
            ps.setString(2, ac.getLastName());
            ps.setString(3, ac.getFirstName());
            ps.setDate(4, (java.sql.Date) ac.getBirthday());
            ps.setBoolean(5, ac.isGender());
            ps.setString(6, ac.getPhone());
            ps.setBoolean(7, ac.isIsUse());
            ps.setInt(8, ac.getRoleInSystem());
            ps.setString(9, ac.getAccount());
            return ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Account getObjectById(String id) {
        String sql = "select * from accounts where account = ?";
        try {
            Connection cnn = getConnection(sc);
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
            String pass = rs.getString("pass");
            String lastName = rs.getString("lastName");
            String firstName = rs.getString("firstName");
            Date birthday = rs.getDate("birthday");
            Boolean gender = rs.getBoolean("gender");
            String phone = rs.getString("phone");
            Boolean isUse = rs.getBoolean("isUse");
            int roleInSystem = rs.getInt("roleInSystem");
            return new Account(id, pass, lastName, firstName, birthday, true, phone, true, roleInSystem);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public List<Account> listAll() {
        List<Account> list = new ArrayList<>();

        String sql = "SELECT * FROM accounts";

        try (
            Connection cnn = getConnection(sc);
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String account = rs.getString("account");
                String pass = rs.getString("pass");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                Date birthday = rs.getDate("birthday");
                boolean gender = rs.getBoolean("gender");
                String phone = rs.getString("phone");
                boolean isUse = rs.getBoolean("isUse");
                int roleInSystem = rs.getInt("roleInSystem");

                Account ac = new Account(
                    account, pass, lastName, firstName,
                    birthday, gender, phone, isUse, roleInSystem
                );

                list.add(ac);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int deleteRec(String id) {
        String sql = "delete accounts where account = ?";
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
}
