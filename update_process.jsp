<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>  
	<%
	request.setCharacterEncoding("utf-8");
	
	//request 객체로 부터 전달 받기
	int seq = Integer.parseInt(request.getParameter("seq"));
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String mail = request.getParameter("mail");
	String address = request.getParameter("address");
	String comment = request.getParameter("comment");	
	
try{	//insert_process와 유사함 참고하면됨
	if(phone1 != ""){
		int numcheck = Integer.parseInt(phone1);
	}	
	
	if(phone2 != ""){
		int numcheck = Integer.parseInt(phone2);
	}
	
	if(name=="")
	{
		%>
		<script>
			alert("'이름'을 입력해 주세요. 필수 입니다.");
			window.history.back();
		</script>
		<%
	}
	else if(phone1=="")
	{
		%>
		<script>
			alert("'전화번호1'을 입력해 주세요. 필수 입니다.");
			window.history.back();
		</script>
		<%
	}
	else if(phone1.length()>11)
	{
		%>
		<script>
			alert("'전화번호1'은 11자리까지 입력 할 수 있습니다.다시 확인해 주세요.");
			window.history.back();
		</script>
		<%
	}
	else if(phone2.length()>11)
	{
		%>
		<script>
			alert("'전화번호2'는 11자리까지 입력 할 수 있습니다. 다시 확인해 주세요.");
			window.history.back();
		</script>
		<%
	}
	else
	{
		try{
						
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			sql="update phonebook set fr_name=?, fr_phone1=?, fr_phone2=?, fr_email=?, fr_address=?, fr_comment=? where seq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone1);
			pstmt.setString(3, phone2);
			pstmt.setString(4, mail);
			pstmt.setString(5, address);
			pstmt.setString(6, comment);
			pstmt.setInt(7, seq);
			pstmt.executeUpdate();
	
			
		}catch(SQLException ex){
			out.print(ex.getMessage());	
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		response.sendRedirect("select.jsp?num="+seq);
	}
}catch(NumberFormatException e)
{
	%>
	<script>
		alert("'전화번호'는 숫자만 입력할 수 있습니다.");
		window.history.back();
	</script>
	<%
}
	
%>
