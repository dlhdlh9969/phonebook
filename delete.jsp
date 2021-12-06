<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<%@ include file="head.jsp" %>
<body>
	<%@ include file="header.jsp" %>
	<div class="divbody">
	<%@ include file="aside.jsp" %>
	<section>
	<div class="divsection">
	<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		
		String sql="select * from phonebook where seq=?";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		while (rs.next())
		{	
			int seq = rs.getInt("seq");
			String name = rs.getString("fr_name");
			String phone1 = rs.getString("fr_phone1");
			String phone2 = rs.getString("fr_phone2");
			if(phone2 == null)
			{
				phone2="";
			}
			
			String mail = rs.getString("fr_email");
			String address = rs.getString("fr_address");
			String comment = rs.getString("fr_comment");
			
			%>
			<div class="big"> 연락처 삭제하기</div>
			<hr>
			<form>
				<div class="textcenter">
					<br>
					<label for="name" >'<%=name %>' 님의 연락처를 삭제 하시겠습니까?
					<a class="btdelete" href='delete_process.jsp?num=<%=seq%>'>삭 제</a>
					<a class="btcancel" href='select.jsp?num=<%=seq%>'>취 소</a>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
			
				</div><br>
				
			</form>
		<%			
		}
		
	}catch(SQLException ex)
	{
		ex.getMessage();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
	}
	
	%>

	</div>
	</section>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>