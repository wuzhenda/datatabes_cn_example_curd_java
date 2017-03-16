package com.sample.data.bean;


public class User {

    public String custom_num;
    public String custom_name;
    public String com_type;
    public String country;
    public String city;
    public String addr;
    public String email;
    public String phone;

    public User(String custom_num, String custom_name, String com_type, String country, String city, String addr, String email, String phone) {
        this.custom_num = custom_num;
        this.custom_name = custom_name;
        this.com_type = com_type;
        this.country = country;
        this.city = city;
        this.addr = addr;
        this.email = email;
        this.phone = phone;
    }

    public String getCustom_num() {
        return custom_num;
    }

    public void setCustom_num(String custom_num) {
        this.custom_num = custom_num;
    }

    public String getCustom_name() {
        return custom_name;
    }

    public void setCustom_name(String custom_name) {
        this.custom_name = custom_name;
    }

    public String getCom_type() {
        return com_type;
    }

    public void setCom_type(String com_type) {
        this.com_type = com_type;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
