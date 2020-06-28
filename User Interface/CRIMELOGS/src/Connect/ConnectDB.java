/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author andres
 */
public class ConnectDB {
    
    
    public static void insertGender(String pdescription) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call insert_gender(?)}");
        stmt.setString(1, pdescription);
        stmt.execute();
             
        
    }
    
    
    public static String getGenderDescription(int pidGender)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call getGenderDescription(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pidGender);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }
}
