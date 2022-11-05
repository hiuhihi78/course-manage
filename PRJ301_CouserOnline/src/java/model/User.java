/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private String username;
    private String password;
    private boolean isAdmin;
    private boolean isActivate;
    private boolean isAuthor;

    public User(String username, String password, boolean isAdmin, boolean isActivate, boolean isAuthor) {
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.isActivate = isActivate;
        this.isAuthor = isAuthor;
    }

    

    public User(){
        
    }

    public boolean isIsAuthor() {
        return isAuthor;
    }

    public void setIsAuthor(boolean isAuthor) {
        this.isAuthor = isAuthor;
    }
    
    
    
    public boolean isIsActivate() {
        return isActivate;
    }

    public void setIsActivate(boolean isActivate) {
        this.isActivate = isActivate;
    }
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "User{" + "username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + ", isActivate=" + isActivate + ", isAuthor=" + isAuthor + '}';
    }
    
    
}
