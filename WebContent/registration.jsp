<%@page import="java.sql.*"%>
<%

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String password=request.getParameter("password");
String mob=request.getParameter("mob");
int id=(int)(Math.random()*99999)+1;
%>
<%
try{
Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system", "sai");
PreparedStatement pstmt=con.prepareStatement("insert into car2 values(?,?,?,?,?,?)");
  pstmt.setInt(1,id);
  pstmt.setString(2,fname);
  pstmt.setString(3,lname);
  pstmt.setString(4,email);
  pstmt.setString(5,password);
  pstmt.setString(6,mob);
   
  int n=pstmt.executeUpdate();
  
  if(n>0){
    %>
    <h3 align=center>Registration Successful</h3>
    <a href="userlohin.html">Login</a>
    <%
  }
  else{
    %>
    <h3 align=center>Registration Failed</h3>
    <a href="registration.html">Try Again</a>
    <%
  }
  
}
catch(Exception e){
  System.out.println(e);
}
  
  
  
  %>