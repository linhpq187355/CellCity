/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Order {

    private int id;
    private int userId;
    private Date orderDate;
    private int totalAmount;
    private String shipAddress;
    private String shipping_name;
    private String shipping_phone;
    private String shipping_email;
    private String shipping_note;
    private String status;
    private String payment;
    private int shippingFee;

    public Order() {
    }

    public Order(int id, int userId, Date orderDate, int totalAmount, String shipAddress, String shipping_name, String shipping_phone, String shipping_email, String shipping_note, String status,String payment,int shippingFee) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.shipAddress = shipAddress;
        this.shipping_name = shipping_name;
        this.shipping_phone = shipping_phone;
        this.shipping_email = shipping_email;
        this.shipping_note = shipping_note;
        this.status = status;
        this.payment = payment;
        this.shippingFee = shippingFee;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipping_name() {
        return shipping_name;
    }

    public void setShipping_name(String shipping_name) {
        this.shipping_name = shipping_name;
    }

    public String getShipping_phone() {
        return shipping_phone;
    }

    public void setShipping_phone(String shipping_phone) {
        this.shipping_phone = shipping_phone;
    }

    public String getShipping_email() {
        return shipping_email;
    }

    public void setShipping_email(String shipping_email) {
        this.shipping_email = shipping_email;
    }

    public String getShipping_note() {
        return shipping_note;
    }

    public void setShipping_note(String shipping_note) {
        this.shipping_note = shipping_note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(int shippingFee) {
        this.shippingFee = shippingFee;
    }

    
}
