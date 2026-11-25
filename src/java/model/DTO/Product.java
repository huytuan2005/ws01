/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DTO;

import java.util.Date;

/**
 *
 * @author phuct
 */
public class Product {
    private String productId;
    private String productName;
    private String productImage;
    private String getBrief;
    private Date postDate;
    private int typeId;
    private String account;
    private String unit;
    private int price;
    private int discount;

    public Product() {
    }

    public Product(String productId, String productName, String productImage, String getBrief, Date postDate, int typeId, String account, String unit, int price, int discount) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.getBrief = getBrief;
        this.postDate = postDate;
        this.typeId = typeId;
        this.account = account;
        this.unit = unit;
        this.price = price;
        this.discount = discount;
    }

    public Product(String productId, String productName, String productImage, String getBrief, int typeId, String account, String unit, int price, int discount) {
         this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.getBrief = getBrief;
        this.typeId = typeId;
        this.account = account;
        this.unit = unit;
        this.price = price;
        this.discount = discount;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getGetBrief() {
        return getBrief;
    }

    public void setGetBrief(String getBrief) {
        this.getBrief = getBrief;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
}
