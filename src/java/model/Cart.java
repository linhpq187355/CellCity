/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Cart {

    private List<Item> items;
    private int totals;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void deleleItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public int getTotal() {
        int t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

    private ProductDetail getProductById(List<ProductDetail> list, int id) {
        for (ProductDetail p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart(String txt,List<ProductDetail> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                System.out.println(s.length);
                for (String i : s) {
                    String[] n = i.split(":");
                    
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    
                    ProductDetail p = getProductById(list, id);
                    Item t;
                    if(p.getIs_sale()==1){
                        t = new Item(p,quantity,p.getSale_price());
                    } else {
                        t = new Item(p,quantity,p.getPrice());
                    }
                    addItem(t);
                }
            }
        } catch (NumberFormatException n) {

        }

    }
    
    public void setTotal(int ship){
        this.totals = getTotal()+ship;
    }
    
    public int getTotalWithShip(){
        return totals;
    }

}
