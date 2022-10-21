<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("email");
String password = request.getParameter("password");

try
{
	Connection con=null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system", "sai");

    System.out.println("Connection Established");
    
    PreparedStatement pstmt = con.prepareStatement("select * from car2 where email=? and password=?");
    pstmt.setString(1,email);
    pstmt.setString(2,password);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next())
    {
      
     session.setAttribute("email", email);
     session.setAttribute("password", password);
     session.setMaxInactiveInterval(1000000);
     response.sendRedirect("cars1.html");
    }
    else
    {
      %>
      <h3>Login Failed</h3><br>
  <a href="userlogin.html">Try Again</a>
      <% 
    }
}
catch(Exception e)
{
  out.println(e);
}



%>
