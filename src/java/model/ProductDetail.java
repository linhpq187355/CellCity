/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class ProductDetail {
    private int id;
    private String screenTech;
    private int ram;
    private int rom;
    private String frontCam;
    private String backCam;
    private int battery;
    private String OS;
    private String sim;
    private String chipset;
    private int productID;
    private float sreenSize;
    private int refreshRate;
    private int price;
    private int stockQuantity;
    private int colorId;
    private Date createdDate;
    private Date lastUpdatedDate;
    private LocalDateTime sale_start;
    private LocalDateTime sale_end;
    private int sale_price;
    private int is_sale;
    

    public ProductDetail() {
    }

    public ProductDetail(int id,String screenTech, int ram, int rom, String frontCam, String backCam, int battery, String OS, String sim, String chipset, int productID, float sreenSize, int refreshRate, int price, int stockQuantity, int colorId, Date createdDate, Date lastUpdatedDate,LocalDateTime sale_start,LocalDateTime sale_end,int sale_price,int is_sale) {
        this.id = id;
        this.screenTech = screenTech;
        this.ram = ram;
        this.rom = rom;
        this.frontCam = frontCam;
        this.backCam = backCam;
        this.battery = battery;
        this.OS = OS;
        this.sim = sim;
        this.chipset = chipset;
        this.productID = productID;
        this.sreenSize = sreenSize;
        this.refreshRate = refreshRate;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.colorId = colorId;
        this.createdDate = createdDate;
        this.lastUpdatedDate = lastUpdatedDate;
        this.sale_start = sale_start;
        this.sale_end = sale_end;
        this.sale_price = sale_price;
        this.is_sale = is_sale;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    public String getScreenTech() {
        return screenTech;
    }

    public void setScreenTech(String screenTech) {
        this.screenTech = screenTech;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getRom() {
        return rom;
    }

    public void setRom(int rom) {
        this.rom = rom;
    }

    public String getFrontCam() {
        return frontCam;
    }

    public void setFrontCam(String frontCam) {
        this.frontCam = frontCam;
    }

    public String getBackCam() {
        return backCam;
    }

    public void setBackCam(String backCam) {
        this.backCam = backCam;
    }

    public int getBattery() {
        return battery;
    }

    public void setBattery(int battery) {
        this.battery = battery;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getChipset() {
        return chipset;
    }

    public void setChipset(String chipset) {
        this.chipset = chipset;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public float getSreenSize() {
        return sreenSize;
    }

    public void setSreenSize(float sreenSize) {
        this.sreenSize = sreenSize;
    }

    public int getRefreshRate() {
        return refreshRate;
    }

    public void setRefreshRate(int refreshRate) {
        this.refreshRate = refreshRate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public LocalDateTime getSale_start() {
        return sale_start;
    }

    public void setSale_start(LocalDateTime sale_start) {
        this.sale_start = sale_start;
    }

    public LocalDateTime getSale_end() {
        return sale_end;
    }

    public void setSale_end(LocalDateTime sale_end) {
        this.sale_end = sale_end;
    }

    public int getSale_price() {
        return sale_price;
    }

    public void setSale_price(int sale_price) {
        this.sale_price = sale_price;
    }

    public int getIs_sale() {
        return is_sale;
    }

    public void setIs_sale(int is_sale) {
        this.is_sale = is_sale;
    }
    
    
}
