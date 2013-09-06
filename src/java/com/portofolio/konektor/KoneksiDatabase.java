/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.portofolio.konektor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author dkrebodesign.com
 */
public class KoneksiDatabase {
    private static Connection koneksi;
    
    

public static Connection getKoneksi(){
try{
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    koneksi = DriverManager.getConnection("jdbc:mysql://localhost:3306/portofolio","root","");

}catch(SQLException e){

Logger.getLogger(KoneksiDatabase.class.getName()).log(Level.SEVERE, null, e);
}  
    return koneksi;

 }
}
