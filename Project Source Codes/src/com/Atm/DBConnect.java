package com.Atm;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DBConnect {
	static String cardDigits2;
	static String pin2;
	Connection con=null;
	
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:orcl","scott","Wipro123");
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		return con;
	}
	public boolean validateUser(String cardDigits, String pin) {
		con=getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from AtmUser where card=? and pin=?");
			ps.setString(1, cardDigits);
			ps.setString(2, pin);
			cardDigits2=cardDigits;
			pin2=pin;
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){  
				return true;
			}  	
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public String miniDate() {
		con=getConnection();
		String cardNumber="";
	
		try
		{
			PreparedStatement pst = con.prepareStatement("select * from AtmUser  where card='"+cardDigits2+"' and pin='"+pin2+"'");
			ResultSet rs=pst.executeQuery();
			while (rs.next()) {
				cardNumber=rs.getString("card");
			}
		}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		return cardNumber;
	}
	public int getBalance(String type) 
    {
		
		int balance=0;
        try 
        {
        	System.out.println("DBConnect getBalance() Running");
        	Statement st=con.createStatement();
        	String sql = "SELECT " + type + " from ATMUSER WHERE CARD = " + cardDigits2;
        	System.out.println("DBconnect : sql : " + sql);
            ResultSet rs =st.executeQuery(sql);

            
            while (rs.next()) 
            {
                balance = rs.getInt(type); 

                System.out.println("Balance : " + balance); 
            }

            //con.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return balance;
    }
	
	public boolean update( String type, int main_balance, int user_amount,String status) 
    {      
		System.out.println("DBConnect Update() Running");
		String sql;
        int count  = 0;
        try 
        {	System.out.println("Updating data in database");
        	Statement st=con.createStatement();
            sql = "UPDATE ATMUSER SET " + type + " = " + main_balance + " WHERE CARD= " + cardDigits2;
            
            System.out.println("DBconnect : sql : " + sql);           
            
            if(st.executeUpdate(sql) == 1)
                count++;
            
            String pattern = "dd-MM-yyyy";
            
            String dateInString =new SimpleDateFormat(pattern).format(new Date());            
            
            sql = "INSERT INTO ATMTransaction values(seq.nextval," + cardDigits2 + ",'" + type + "'," + user_amount + ",TO_DATE('" + dateInString + "', 'DD/MM/YYYY'),'"+status+"')";
            
            System.out.println(sql); 

            if(st.executeUpdate(sql) == 1)
            	count++;    
            
            //con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }        
        if(count == 2)
            return true;
        else
            return false;
    }
	public boolean updatePin(int new_pin)
    {
		 String sql = "UPDATE ATMUSER SET PIN = " + new_pin + " WHERE CARD = " + cardDigits2;
		try {
			Statement st=con.createStatement();
			if(st.executeUpdate(sql)==1)
				return true;
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
       
		
 

    }
	
}
