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
			<form>
			<div class="big"> 연락처 출력</div>
			<div class="aliright">
					<a class="btedit" href='update.jsp?num=<%=seq%>'>수 정</a>
					<a class="btdelete" href='delete.jsp?num=<%=seq%>'>삭 제</a>
				</div>
			<hr>
			
				<div>
					<label for="name">이  름</label><br>
					<input type="text" id="name" name="name" readonly value="<%= name%>">
				</div><br>
				<div>
					<label for="phone1">전화번호1</label><br>
					<input type="text" id="phone1" name="phone1" readonly value="<%= phone1%>">
				</div><br>
				<div>
					<label for="phone2">전화번호2</label><br>
					<input type="text" id="phone2" name="phone2" readonly value="<%= phone2%>">
				</div><br>
				<div>
					<label for="mail">E-mail</label><br>
					<input type="text" id="mail" name="mail" readonly value="<%= mail%>">
				</div><br>
				<div>
					<label for="address">주 소</label><br>
					<input type="text" id="address" name="address" readonly value="<%= address%>">
				</div><br>
				<div>
					<label for="comment">메모</label><br>
					<textarea rows="5" id="comment" name="comment" readonly><%= comment%></textarea>
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