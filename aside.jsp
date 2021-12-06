<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>    
<aside>
	<div class="divaside">
	
	<%
	PreparedStatement pstmtCt = null;
	ResultSet rsCt = null;
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		
		pstmtCt = conn.prepareStatement("select count(seq) as count from phonebook");
		rsCt = pstmtCt.executeQuery(); 
		
		int count=0; // 등록 숫자를 만들기 위한 변수
		rsCt.next();
		count= rsCt.getInt("count"); 
		
		
		out.print("<div class=\"big\"><img src=\"img/book.png\" width=\"30px\" height=\"30px\"> 등록수 [ " + count + "명 ]</div>");
		out.print("<hr>");
		out.print("<ul>");
		pstmt = conn.prepareStatement("select seq, fr_name from phonebook order by fr_name");
		rs = pstmt.executeQuery(); 
		while (rs.next()){
			int seq = rs.getInt("seq");
			String name = rs.getString("fr_name"); 
			
			String list="<a href='select.jsp?num=" + seq + "'><li>" + name + "</li></a>";
			
			out.print(list);
			
			
		}
		%>
		</ul>
		<%	
		if(count ==1 || count == 2)
		{
			out.print("<hr>");
		}
		
		
		switch(count)
		{
			case 0:
				out.print("등록자가 없습니다.<br>친구가 없어요?!<br> 진심 개불쌍 ㅜㅜ");
				break;
			case 1:
				out.print("오~~ 한명!<br>");
				break;
			case 2:
				out.print("오~~ 두명!<br>");
				break;
		}
		
		
	}catch(SQLException ex){
		ex.getMessage();		
	}finally{
		if(rs != null) rs.close();
		if(rsCt != null) rsCt.close();
		if(pstmt != null) pstmt.close();
		if(pstmtCt != null) pstmtCt.close();
		if(conn != null) conn.close();
	}
	
	
	%>
	</ul>
	<hr>
	<a href="insert.jsp"><div class="big" ><img src="img/plus.png" width="30px" height="30px"> 연락처 추가하기</div></a>
	
	</div>
</aside>