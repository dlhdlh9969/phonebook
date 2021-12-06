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
		<form action="insert_process.jsp" method="post">
		<div class="big"> 연락처 추가하기</div>
		<div class="aliright">
				<button type="submit" class="btinsert" id="inputck">등 록</button>
				</div>
		<hr>
		
			<div>
				<label for="name">이  름</label>
				
				<input type="text" id="name" name="name" placeholder=" '이름'을 입력해 주세요. 필수 입니다.">
			</div><br>
			<div>
				<label for="phone1">전화번호1</label><br>
				<input type="text" id="phone1" name="phone1" placeholder="'전화번호'를 입력해주세요. 필수 입니다.">
			</div><br>
			<div>
				<label for="phone2">전화번호2</label><br>
				<input type="text" id="phone2" name="phone2" placeholder="필요하다면'전화번호'를 추가로 입력해주세요.">
			</div><br>
			<div>
				<label for="mail">E-mail</label><br>
				<input type="text" id="mail" name="mail" placeholder="'E-mail'을 입력해주세요. 예)abc@naver.com">
			</div><br>
			<div>
				<label for="address">주 소</label><br>
				<input type="text" id="address" name="address" placeholder="'주소'를 입력해 주세요.">
			</div><br>
			<div>
				<label for="comment">메모</label><br>
				<textarea rows="5" id="comment" name="comment" placeholder="기타 사항을 입력해주세요."></textarea>
			</div><br>
			<br>
		</form>

	</div>
	</section>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>