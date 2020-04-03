package com.Databse;

import java.sql.*;

public class dbconnect {
	Connection con = null;
	String user, pass;

	public Connection getDbConnection() {
		
		String url = "jdbc:mysql://localhost:3306/mahi?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,"root","");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return con;
	}

}



