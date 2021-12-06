<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>  
	<%
	request.setCharacterEncoding("utf-8");
	
	//request 객체로 부터 전달 받기
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String mail = request.getParameter("mail");
	String address = request.getParameter("address");
	String comment = request.getParameter("comment");
	
	int seq=0;
	PreparedStatement pstmtMaxseq =null;
	
try{
	if(phone1 != ""){	//phone1이 숫자만 넘어왔는지 체크하기 위한 조건문. 강제로 exception을 발생 시킨다.
		int numcheck = Integer.parseInt(phone1);
	}	
	
	if(phone2 != ""){	//phone2가 숫자만 넘어왔는지 체크하기 위한 조건문. 강제로 exception을 발생 시킨다.
		int numcheck = Integer.parseInt(phone2);
	}
	
	
	if(name=="")	//not null인 필드를 위해 빈값 체크
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
	else
	{
		try{
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			sql="insert into phonebook (fr_name, fr_phone1, fr_phone2, fr_email, fr_address, fr_comment) values(?, ?, ?, ?, ?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone1);
			pstmt.setString(3, phone2);
			pstmt.setString(4, mail);
			pstmt.setString(5, address);
			pstmt.setString(6, comment);
			pstmt.executeUpdate();
			
			pstmtMaxseq = conn.prepareStatement("select max(seq) as seq from phonebook");
			rs = pstmtMaxseq.executeQuery();
			
			rs.next();
			seq = rs.getInt("seq");
			
		}catch(SQLException ex){
			out.print(ex.getMessage());	
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(pstmtMaxseq != null) pstmtMaxseq.close();
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
