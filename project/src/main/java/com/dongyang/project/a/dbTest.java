package com.dongyang.project.a;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbTest {
	public void test() throws Exception {
//	    Class.forName("org.mariadb.jdbc.Driver"); // 마리아DB
	     Class.forName("com.mysql.jdbc.Driver"); //MySQL

//	    Connection con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/test", "root",     "passwd");// 마리아DB
	    Connection con = DriverManager.getConnection("jdbc:mysql://13.124.251.39:3306/ypos","root","1234"); //MySQL
	    System.out.println(con);
	    }
}
