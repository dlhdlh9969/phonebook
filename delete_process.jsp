<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %> 

<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));

sql = "delete from phonebook where seq=?";

try
{
	Class.forName(driver);
	conn = DriverManager.getConnection(url, uid, upw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.executeUpdate();
}
catch(SQLException ex)
{
	out.print(ex.getMessage());	
}
finally
{
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}

response.sendRedirect("first.jsp");

 %>