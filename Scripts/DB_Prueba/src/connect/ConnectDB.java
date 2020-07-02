/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;
import java.util.*;
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
    
    /**-----------Conexiones con la tabla PERSON------------------**/
    
    
    public static void insertPerson(int pid, String pFirstName, String pLastName, Date pbirthday, String pemail, String pusername, String ppassword, int pidGender,int pidInstitution,int pidBinnacle,int pidTypePerson) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_.insert_person(?,?,?,?,?,?,?,?,?,?,?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pFirstName);
        stmt.setString(3,pLastName);
        stmt.setDate(4, new java.sql.Date(pbirthday.getTime()));
        stmt.setString(5,pemail);
        stmt.setString(6, pusername);
        stmt.setString(7, ppassword);
        stmt.setInt(8, pidGender);
        stmt.setInt(9, pidInstitution);
        stmt.setInt(10, pidBinnacle);
        stmt.setInt(11, pidTypePerson);
        stmt.execute();
             
        
    }
    
    public static void insertUser(int pid, String pFirstName, String pLastName, Date pbirthday, String pemail, int pidGender, int pidInstitution,int pidBinnacle,int pidTypePerson) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_.insert_person(?,?,?,?,?,?,?,?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pFirstName);
        stmt.setString(3,pLastName);
        stmt.setDate(4, new java.sql.Date(pbirthday.getTime()));
        stmt.setString(5,pemail);
        stmt.setInt(6, pidGender);
        stmt.setInt(7, pidInstitution);
        stmt.setInt(8, pidBinnacle);
        stmt.setInt(9, pidTypePerson);
        stmt.execute();
             
        
    }
    
    
    
     
    public static void removePerson( int pid) throws SQLException{
      String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.remove_person(?)}");
        stmt.setInt(1, pid);
        stmt.execute();
     }
     
    public static void pdate_person_first_name(int pid, String pFirstName)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_first_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pFirstName);
        stmt.execute();
     }
     
    public static void update_person_Last_name(int pid, String pLastName)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_last_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pLastName);
        stmt.execute();
     }
     
    public static void update_person_birth_day(int pid, Date pdate)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_birth_day(?,?)}");
        stmt.setInt(1,pid);
        stmt.setDate(2, new java.sql.Date(pdate.getTime()));
        stmt.execute();
        }
     
    public static void update_person_email(int pid, String pemail)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_email(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pemail);
        stmt.execute();
          
          
      }
      
    public static void update_person_user_name(int pid, String pusername)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_user_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pusername);
        stmt.execute();
      }
      
    public static void update_person_password(int pid, String ppassword)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_password(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,ppassword);
        stmt.execute();
      }
      
    public static void update_person_id_gender(int pid, int pidGender)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_id_gender(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidGender);
        stmt.execute();
      
      
      }
       
    public static void update_person_id_institution(int pid, int pidInstitution)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_id_institution(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidInstitution);
        stmt.execute();
       
       }

    public static void update_person_type_person(int pid, int pidTypePerson)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_type_person(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidTypePerson);
        stmt.execute();
       
       }

    public static String getPersonFirstName(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonFirstName(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonLastName(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonLastName(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonBirthDay(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonBirthDay(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonUsername(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonUsername(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonPassword(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonPassword(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonIdGender(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdGender(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static int  getPersonAge(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonAge(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }

    public static int  getPersonIdInstitution(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdInstitution(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
      
    public static int  getPersonIdBinnacle(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdBinnacle(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
     
    public static int  getPersonIdTypePerson(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdTypePerson(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }



/**-----------Conexiones con la tabla Gender------------------**/

    public static void insert_gender(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.insert_gender(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_gender(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.remove_gender(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }
    
        public static void update_gender_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.update_gender_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getGenderDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_Gender.getGenderDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
   
/**-----------Conexiones con la tabla Type_Person------------------**/

public static void insert_type_person(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.insert_type_person(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }

public static void remove_type_person(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.remove_type_person(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
public static void update_type_person_description(int pid, String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.remove_type_person(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }

    public static String getTypePersonDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_type_person.getTypePersonDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
/**-----------Conexiones con la tabla Institucion------------------**/
   public static void insert_institution_name(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Institution.insert_institution_name(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       } 

      public static void remove_institution(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Institution.remove_institution(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_institution_name(int pid, String pname)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Institution.remove_institution(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2, pname);
        stmt.execute();
       
       } 
      
      
      
    public static String getInstitutionName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_type_person.getInstitutionName(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
    
/**-----------Conexiones con la tabla User_password_binnacle------------------**/
      
      public static void insert_password_binnacle(String pnew_password)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_password_binnacle.insert_password_binnacle(?)}");
        stmt.setString(1,pnew_password);
        stmt.execute();
       
       }    
      
      
      
        public static void remove_password_binnacle(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_password_binnacle.remove_password_binnacle(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }    
      
    public static void update_password_binnacle(int pid, String pnewPassword)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_password_binnacle.update_password_binnacle(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pnewPassword);
        stmt.execute();
       
       }

        public static String getBinnacleOldPassword(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_password_binnacle.getBinnacleOldPassword(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
      
/**-----------Conexiones con la tabla BAN------------------**/
      
      
      public static void insert_ban(Date ban_ends, int pidBan_motive)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Ban.insert_ban(?,?)}");
        stmt.setDate(1, new java.sql.Date(ban_ends.getTime()));
        stmt.setInt(2, pidBan_motive);
        stmt.execute();
       
       }    
      
      
    public static void remove_ban(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Ban.remove_ban(?)}");
        stmt.setInt(1, pid);
        stmt.execute();
       
       }    
      
    
    public static void update_ban_ends(int pid, Date pends)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Ban.update_ban(?)}");
        stmt.setInt(1, pid);
        stmt.setDate(2, new java.sql.Date(pends.getTime()));
        stmt.execute();
       
       } 
      
      
    /**public static String getBanMotiveDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_password_binnacle.getBinnacleOldPassword(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    **/
      
      
/**-----------Conexiones con la tabla BAN_Motive------------------**/
      
      public static void insert_ban_motive(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Ban_Motive.insert_ban_motive(?)}");
        stmt.setString(1,pdescription); 
        stmt.execute();
       
       }
      
      
        public static void remove_ban_motive(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Ban_Motive.remove_ban_motive(?)}");
        stmt.setInt(1,pid); 
        stmt.execute();
       
       }    
        
        public static void update_ban_motive(int pid, String pMotive)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Ban_Motive.remove_ban_motive(?,?)}");
        stmt.setInt(1,pid); 
        stmt.setString(2, pMotive);
        stmt.execute();
       
        }
        
        
        public static String getBanMotiveDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_Ban_Motive.getBanMotiveDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
      
        }
      
      
    /**-----------Conexiones con la tabla Photo------------------**/
        public static void insert_Photo(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Photo.insert_photo(?)}");
        stmt.setString(1,pdescription); 
        stmt.execute();
       
       } 
        
        
        public static void remove_photo(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Photo.remove_photo(?)}");
        stmt.setInt(1,pid); 
        stmt.execute();
        }
        
        public static void update_photo_description (int pid, String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Photo.update_photo_description (?,?)}");
        stmt.setInt(1,pid); 
        stmt.execute();
       } 
        
        
        
      
      
      
        public static String getPhotodescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_Photo.getPhotodescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
      
        }
      
      
       /**-----------Conexiones con la tabla PersonXban y PersonXPhoto------------------**/
    public static void insert_personXban(int pidPerson, int pidBan)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personXban.insert_personXban(?,?)}");
        stmt.setInt(1,pidPerson); 
        stmt.setInt(2, pidBan);
        stmt.execute();
       
       } 
    
    public static void insert_personXphoto(int pidPerson, int pidPhoto)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxphoto.insert_personXban(?,?)}");
        stmt.setInt(1,pidPerson); 
        stmt.setInt(2, pidPhoto);
        stmt.execute();
       
       }  
    
        /**----------Conexiones de la Tabla Province--------**/
    
    public static void insert_Province(String p_name, int p_country)throws SQLException{
     String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
     String uName = "FI";
     String uPass = "FI";
     
     Connection con = DriverManager.getConnection(host, uName, uPass);
     CallableStatement stmt = con.prepareCall("{ call control_province.insert_province(?,?)}");
     stmt.setString(1, p_name);
     stmt.setInt(2,p_country);
     
     stmt.execute();
    }
    
    
    public static void remove_Province(int p_id_province)throws SQLException{
     String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
     String uName = "FI";
     String uPass = "FI";
     
     Connection con = DriverManager.getConnection(host, uName, uPass);
     CallableStatement stmt = con.prepareCall("{ call control_province.remove_province(?)}");  
     stmt.setInt(1, p_id_province);
     
     stmt.execute();
    }
    
    
    public static void update_Province(String p_name, int p_id_Province)throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_province.update_province(?,?)}");
    stmt.setString(1, p_name);
    stmt.setInt(2, p_id_Province);
    
    stmt.execute();
    }
    
    
    public static String getProvinceName(int pId) throws SQLException{
        
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_province.getProvinceName(?)}");
    
    
    stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(1, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r; 
    }
    
    public static int getProvinceCountry(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_province.getProvinceCountry(?)}");
   
    
    stmt.registerOutParameter(1, OracleTypes.NUMBER);
    stmt.setInt(1, pId);
    stmt.executeQuery();
    int r =  stmt.getInt(1);

    System.out.println(r);
    return r;

    }
    
    public static int getIDProvince(String pprovince) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_province.getIDProvince(?)}");
    stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setString(1, pprovince);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r; 
    }
    
    
    /**----------Conexiones de la Tabla Crime Type--------**/
    
    public static void insert_Crime_Type(String p_description) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_crime_type.insert_Crime_Type(?)}");
    stmt.setString(1,p_description);
    
    stmt.execute();
    }
    
    public static void remove_Crime_Type(int p_id_Crime_type) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_crime_type.remove_Crime_type(?)}");
    stmt.setInt(1,p_id_Crime_type);
    
    stmt.execute();
    }
    
    public static void update_Crime_type(String p_description, int p_id_Crime_type) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_crime_type.update_Crime_type(?,?)}");
    stmt.setString(1, p_description);
    stmt.setInt(2, p_id_Crime_type);
   
    stmt.execute();
    }
    
    public static String getCrimeTypeDescription(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_crime_type.getCrimeTypeDescription(?)}");
    stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(1, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r; 
    }
    
    
    public static int getIDcrimetype(String pcrime_type) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_crime_type.getIDcrimetype(?)}");
    stmt.registerOutParameter(1, OracleTypes.NUMBER);
    stmt.setString(1, pcrime_type);
    stmt.executeQuery();
    int r =  stmt.getInt(1);

    System.out.println(r);
    return r;
    }
    
    
    /**-----------Conexiones con la tabla PERSON CREATE FILE------------------**/
    
    public static void insert_person_create_file(int p_id_person, int p_id_criminal_record) throws SQLException {
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_create_file.insert_person_create_file(?,?)}");
    stmt.setInt(1, p_id_person);
    stmt.setInt(2, p_id_criminal_record);
    
    stmt.execute();
    }
    
    public static void remove_person_crete_file(int p_id_person,int p_id_criminal_record) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_create_file.insert_person_create_file(?,?)}");

    stmt.setInt(1, p_id_person);
    stmt.setInt(2, p_id_criminal_record);
    
    stmt.execute();
    
    }
    
    public static void remove_person_create_file(int p_id_person, int p_id_criminal_record) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_create_file.remove_person_create_file(?,?)}");   
    
    stmt.setInt(1, p_id_person);
    stmt.setInt(2,p_id_criminal_record);
    
    stmt.execute();
    }
    
    public static void UPersonCreateFilePerson (int current_id_person, int p_id_Criminal_Record, int new_id_person) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_create_file.UPersonCreateFilePerson(?,?,?)}");   
    
    stmt.setInt(1, current_id_person);
    stmt.setInt(2, p_id_Criminal_Record);
    stmt.setInt(3, new_id_person);
    
    stmt.execute();
    }
    
    public static void UPersonCreateFleRecord(int current_id_Criminal_record, int p_id_person, int new_id_criminal_record) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_create_file.UPersonCreateFileRecord(?,?,?)}"); 
    stmt.setInt(1, current_id_Criminal_record);
    stmt.setInt(2, p_id_person);
    stmt.setInt(3, new_id_criminal_record);
    
    stmt.execute();
    }
    
    /**-----------Conexiones con la tabla District------------------**/
    
    public static void insert_district(String p_name, int p_canton) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.insert_district(?,?)}"); 
    stmt.setString(1, p_name);
    stmt.setInt(2, p_canton);
    
    stmt.execute();
    }
    
    public static void remove_district( int p_id_district) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.remove_district(?)}"); 
    stmt.setInt(1, p_id_district);
    
    stmt.execute();
    }
    
    public static void update_district(String p_name, int p_id_district) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.update_district(?,?)}"); 
    stmt.setString(1, p_name);
    stmt.setInt(2, p_id_district);
    
    stmt.execute();
    }
    
    public static String getDistrictName(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_district.getDistrictName(?)}"); 
    stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(1, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r; 
    }
    
    public static int getDistrictCanton(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_district.getDistrictCanton(?)}"); 
    stmt.registerOutParameter(1, OracleTypes.NUMBER);
    stmt.setInt(1, pId);
    stmt.executeQuery();
    int r =  stmt.getInt(1);

    System.out.println(r);
    return r;
    }
    
    public static void getIDdistrict(String pdescription) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
    String uName = "FI";
    String uPass = "FI";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_district.getIDdistrict(?)}"); 
    stmt.setString(1, pdescription);
    
    stmt.execute();
    }
    
    
     /*-----------------------------------------COUNTRY-----------------------------------*/
  public static void insert_country(String p_name)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.insert_country(?,?)}");
        stmt.setString(1,p_name);
        stmt.execute();
       
       } 

      public static void remove_country(int p_id_country)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.remove_country(?)}");
        stmt.setInt(1,p_id_country);
        stmt.execute();
       
       } 


      
      public static void update_country(int p_id_country, String pname)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.update_country(?,?)}");
        stmt.setInt(1,p_id_country);
        stmt.setString(2, pname);
        stmt.execute();
       
       } 
      
      
      
    public static String getCountryName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_country.getCountryName(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getIDCountry(String pcountry)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_country.getIDCountry(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pcountry);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
     /*-----------------------------------------COMMUNITY-----------------------------------*/
    
    public static void insert_community(String p_name, int p_district_id)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_community.insert_community(?,?)}");
        stmt.setString(1,p_name);
        stmt.setInt(2,p_district_id);
        stmt.execute();
       
       } 

      public static void remove_community(int p_id_community)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_community.remove_community(?)}");
        stmt.setInt(1,p_id_community);
        stmt.execute();
       
       } 


      
      public static void update_community(String p_name,int p_id_community )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_community.update_community(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2,p_id_community);
        stmt.execute();
       
       } 
      
      
      
    public static String getCommunityName(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_community.getCommunityName(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getCommunityDistrict(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_community.getCommunityDistrict(?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    public static int getIDCommunity(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_community.getIDCommunity(?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
     /*-----------------------------------------CANTON---------------------------------------*/
    
    public static void insert_canton(String p_name, int p_province_id)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.insert_canton(?,?)}");
        stmt.setString(1,p_name);
        stmt.setInt(2,p_province_id);
        stmt.execute();
       
       } 

      public static void remove_canton(int p_id_canton)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.remove_canton(?)}");
        stmt.setInt(1,p_id_canton);
        stmt.execute();
       
       } 


      
      public static void update_canton(String p_name,int p_id_canton)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.update_canton(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2,p_id_canton);
        stmt.execute();
       
       } 
      
      
    public static String getCantonName(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_canton.getCantonName(?)}");

        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getCantonProvince(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_canton.getCantonProvince(?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    public static int getIDCanton(String pcanton)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_canton.getIDCanton(?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pcanton);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    /*-----------------------------------------CRIMINAL RECORD-----------------------------------*/
    
     public static void insertCriminaRecord(String p_description, int p_community_id, int id_crime_type, Date p_crime_date ) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_criminal_record.insert_Criminal_Record(?,?,?,?)}");

        stmt.setString(1,p_description);
        stmt.setInt(2, p_community_id);
        stmt.setInt(3, id_crime_type);
        stmt.setDate(4, new java.sql.Date(p_crime_date.getTime()));
        stmt.execute();
  
    }
     
     public static void removeCriminalRecord(int pidCriminalRecord)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_criminal_record.remove_Criminal_Record(?}");
        stmt.setInt(1,pidCriminalRecord);
        stmt.execute();
       
       } 


      
      public static void UCriminalRecordDescription(String pdescription, int pidCriminalRecord)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_criminal_record.UCriminalRecordDescription(?,?)}");
        stmt.setString(1, pdescription);
        stmt.setInt(2,pidCriminalRecord);
        stmt.execute();
       
       } 
      public static void UCriminalRecordCrimeType(String pCrimeType, int pidCriminalRecord)throws SQLException{
            String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
            String uName = "PE";
            String uPass = "PE";

            Connection con = DriverManager.getConnection(host, uName, uPass);
            CallableStatement stmt = con.prepareCall("{ call control_criminal_record.UCriminalRecordCrimeType(?,?)}");
            stmt.setString(1, pCrimeType);
            stmt.setInt(2,pidCriminalRecord);
            stmt.execute();
       
       } 
       public static void UCriminalRecordCommunity(String pCommunity, int pidCriminalRecord)throws SQLException{
            String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
            String uName = "PE";
            String uPass = "PE";

            Connection con = DriverManager.getConnection(host, uName, uPass);
            CallableStatement stmt = con.prepareCall("{ call control_criminal_record.UCriminalRecordCommunity(?,?)}");
            stmt.setString(1, pCommunity);
            stmt.setInt(2,pidCriminalRecord);
            stmt.execute();

       } 
        public static void UCriminalRecordCrimeDate(Date pCrimeDate, int pidCriminalRecord)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_criminal_record.UCriminalRecordCrimeDate(?,?)}");
        stmt.setDate(1, new java.sql.Date(pCrimeDate.getTime()));
        stmt.setInt(2,pidCriminalRecord);
        stmt.execute();
       
       } 
    public static String getCriminalRecordDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_criminal_record.getCriminalRecordDescription(?)}");

        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getCriminalRecordCrimeType(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_criminal_record.getCriminalRecordCrimeType(?)}");

        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    public static int getCriminalRecordCommunity(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_criminal_record.getCriminalRecordCommunity(?)}");

        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    public static String getCriminalRecordCrimeDate(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_criminal_record.getCriminalCrimeDate(?)}");

        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     /*-----------------------------------------PERSON REGISTER FILE-----------------------------------*/
    
     public static void insertPersonRegisterFile(int pidPerson ,int pCriminalRecord, int psentenceYears, Date psentenceStart, 
             Date psentenceEnd,Date psentenceExpiration, Date psentenceDate,int psentenceNumber, String pHouseforJail, String presolution ) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.insert_person_REgister_file(?,?,?,?,?,?,?,?,?,?)}");

        stmt.setInt(1,pidPerson);
        stmt.setInt(2, pCriminalRecord);
        stmt.setInt(3, psentenceYears);
        stmt.setDate(4, new java.sql.Date(psentenceStart.getTime()));
        stmt.setDate(5, new java.sql.Date(psentenceEnd.getTime()));
        stmt.setDate(6, new java.sql.Date(psentenceExpiration.getTime()));
        stmt.setDate(7, new java.sql.Date(psentenceDate.getTime()));
        stmt.setInt(8, psentenceNumber);
        stmt.setString(9,pHouseforJail);
        stmt.setString(10,presolution);
        stmt.execute();
  
    }
     
     public static void removePersonRegisterFile(int pidPerson, int pidCriminalRecord)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.remove_person_register_file(?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.execute();
       
       } 

     public static void UPRF_Person(int pidPerson, int pidCriminalRecord, int newIdperson)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Person(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setInt(3,newIdperson);
        stmt.execute();
       }
     
     public static void UPRF_CriminalRecord(int pidPerson, int pidCriminalRecord, int newIdCriminalRecord)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_CriminalRecord(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setInt(3,newIdCriminalRecord);
        stmt.execute();
       }
     
     public static void UPRF_SentenceYears(int pidPerson, int pidCriminalRecord, int newSentenceYears)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Sentence_years(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setInt(3,newSentenceYears);
        stmt.execute();
       }
     
     public static void UPRF_SentenceStart(int pidPerson, int pidCriminalRecord, Date newSentenceStart)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Sentence_start(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setDate(3, new java.sql.Date(newSentenceStart.getTime()));
        stmt.execute();
       }
     
     public static void UPRF_SentenceEnd(int pidPerson, int pidCriminalRecord, Date newSentenceEnd)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Sentence_end(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setDate(3, new java.sql.Date(newSentenceEnd.getTime()));
        stmt.execute();
       }
     
     public static void UPRF_SentenceExpiration(int pidPerson, int pidCriminalRecord, Date newSentenceExpiration)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Sentence_expiration(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setDate(3, new java.sql.Date(newSentenceExpiration.getTime()));
        stmt.execute();
       }
     public static void UPRF_SentenceDate(int pidPerson, int pidCriminalRecord, Date newSentenceDate)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Sentence_date(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setDate(3, new java.sql.Date(newSentenceDate.getTime()));
        stmt.execute();
       }
     
     public static void UPRF_SentenceNumber(int pidPerson, int pidCriminalRecord, int newSentenceNumber)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Sentence_number(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setInt(3,newSentenceNumber);
        stmt.execute();
       }
     
      public static void UPRF_HouseforJail(int pidPerson, int pidCriminalRecord, String newHouseforJail)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_House_for_jail(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setString(3,newHouseforJail);
        stmt.execute();
       }
     
       public static void UPRF_Resolution(int pidPerson, int pidCriminalRecord, String newResolution)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_register_file.U_PRF_Resolution(?,?,?)}");
        stmt.setInt(1,pidPerson);
        stmt.setInt(2,pidCriminalRecord);
        stmt.setString(3,newResolution);
        stmt.execute();
       }
      
    public static int getPRFSentenceYears(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentence_years(?,?)}");

        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pIdPerson);
         stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
       public static String getPRFSentenceResolution(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentenceResolution(?,?)}");

        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pIdPerson);
         stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
       public static String getPRFSentenceStart(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentence_start(?,?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pIdPerson);
        stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     public static String getPRFSentenceEnd(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentence_end(?,?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pIdPerson);
        stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
      public static String getPRFSentenceExpiration(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentence_expiration(?,?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pIdPerson);
        stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
      
       public static String getPRFSentenceDate(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentence_date(?,?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pIdPerson);
        stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
        public static int getPRFSentenceNumber(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentence_number(?,?)}");

        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pIdPerson);
         stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
       public static String getPRFHouseforJail(int pIdPerson, int pIdCriminalRecord)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_register_file.getPRFSentenceHouse_For_Jail(?,?)}");

        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pIdPerson);
         stmt.setInt(3, pIdCriminalRecord);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
        
        /*-----------------------------------------QUERIES-----------------------------------*/
        
        
        public static java.sql.ResultSet UsersListQuery()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call control_queries.usersList()}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        
        
        
        }
        
        
        public static java.sql.ResultSet NewCriminalRecordquery()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.NewCriminalRecord()}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        }
        
        
        public static java.sql.ResultSet UserWithoutChangequery(int days)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.UserWithoutChange(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, days);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
        
        
        public static java.sql.ResultSet MostDangerousZonesquery(int days)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.MostDangerousZones(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, days);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        
        }
        
        
        public static java.sql.ResultSet BanUsersquery()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.BanUsers()}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
     
        }
        
        public static java.sql.ResultSet ExpiringRecordWithPersonquery()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.ExpiringRecordWithPerson()}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
        public static java.sql.ResultSet personHasFilequery(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.personHasFile(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pid);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
        
        
        public static java.sql.ResultSet filesbygenderquery(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.filesbygender(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pid);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
        
        
        public static java.sql.ResultSet crimes_per_monthquery(int pyear)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.crimes_per_month(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pyear);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
        
        public static java.sql.ResultSet topPersonMostFilesquery(int pnumber)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.topPersonMostFiles(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pnumber);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
        public static java.sql.ResultSet personbycrimequery(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_queries.personbycrime(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pid);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
      
       
}
      
     
   
