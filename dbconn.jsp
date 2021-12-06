<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%!
Connection conn = null;	// db Connection 객체
//Statement stmt = null;	// 쿼리를 보내기 위한 Statement객체
PreparedStatement pstmt= null;
ResultSet rs = null;	// 쿼리 결과를 받아오기 위한 ResultSet 객체. hashmap과 유사한 데이터 배열로 받아 온다.

String driver = "com.mysql.cj.jdbc.Driver";	// jdbc 드라이버

//DB 종류에 따라 주소 밑 옵션 값이 조금씩 달라질 수 있다. 
String url = "jdbc:mysql://192.168.0.3:3306/testdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";

String uid = "testuser";	//db계정
String upw = "11223344";	//계정 비번

String sql;
%>
   
