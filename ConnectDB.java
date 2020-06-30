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
    
    
    public static void insertGender(int pid, String pFirstName, String pLastName, Date pbirthday, String pemail, String pusername, String ppassword, int pidGender,int pidInstitution,int pidBinnacle,int pidTypePerson) throws SQLException{
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
     
    public static void removePersson( int pid) throws SQLException{
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
    
    
        
        
        
        
        
        
        
        
      
      
}
      
     
   
