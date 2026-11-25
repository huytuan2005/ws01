/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletContext;

/**
 *
 * @author phuct
 */
public class ConnectDB {

    private String hostName;
    private String port;
    private String dbName;
    private String user;
    private String pass;

    public ConnectDB() {
    }

    public ConnectDB(String hostName, String port, String dbName, String user, String pass) {
        this.hostName = hostName;
        this.port = port;
        this.dbName = dbName;
        this.user = user;
        this.pass = pass;
    }

    public ConnectDB(ServletContext sc) {
        this.hostName = sc.getInitParameter("hostName");
        this.port = sc.getInitParameter("dbPort");
        this.dbName = sc.getInitParameter("dbName");
        this.user = sc.getInitParameter("userName");
        this.pass = sc.getInitParameter("userPass");
    }

    public String getURLString() {
        return String.format("jdbc:sqlserver://%s:%s;databaseName=%s", this.hostName, this.port, this.dbName);
    }

    public Connection getConnection() throws SQLException, ClassNotFoundException {

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection( getURLString(), this.user, this.pass);
    }
}
