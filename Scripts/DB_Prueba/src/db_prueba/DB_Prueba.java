/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db_prueba;

import Connect.ConnectDB;
import java.sql.SQLException;
/**
 *
 * @author Diego
 */
public class DB_Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)throws SQLException {
        // TODO code application logic here
  
    ConnectDB.insert_institution_name("O.I.J");

    }
}
