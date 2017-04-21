package com.homework.ts.model;

/**
 * Created by ts on 2017/4/14.
 */

public class Clothes {
    private int id;
    private String name;
    private String logo;
    private String clothesPrice = "¥25.00";
    private String clothesImage;
    private int category_id;

    public Clothes(String name, String clothesPrice, String clothesImage){
        this.clothesImage = clothesImage;
        this.name = name;
        this.clothesPrice = clothesPrice;
    }


    public String getClothesPrice() {
        return clothesPrice;
    }

    public void setClothesPrice(String clothesPrice) {
        this.clothesPrice = clothesPrice;
    }

    public String getClothesImage() {
        return clothesImage;
    }

    public void setClothesImage(String clothesImage) {
        this.clothesImage = clothesImage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
