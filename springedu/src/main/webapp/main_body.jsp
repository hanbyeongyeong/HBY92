<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <main role="main" class="container">
  
		<%-- 	<c:if test="${user ne null }">
				<b>로그아웃</b>
			</c:if>
			<c:if test="${user eq null }">
				<b>로그인</b>
			</c:if>
		<hr />
			<c:choose>
				<c:when test="${user ne null }">
					<b>로그아웃</b>
				</c:when>
				<c:when test="${user eq null }">
					<b>로그인</b>
				</c:when>
			</c:choose>
		<hr />	 --%>
			<c:choose>
				<c:when test="${sessionScope.user ne null }">
					<h3 class="pagination pagination-sm justify-content-center">환영합니다!  [ ${user.nickName } ] 님 행복한 하루되세요. </h3><br>
					<b>상태:로그인</b><br><br>
						아이디: ${user.id } <br>
						<%-- ${user.pw } <br> --%>
						닉네임: ${user.nickName } <br>
						생년월일: ${user.birth } <br>
						성별: ${user.gender } <br>
						전화번호: ${user.tel } <br>
						지역: ${user.region } <br>
				</c:when>
				<c:otherwise>
					<ul class="pagination pagination-sm justify-content-center">반갑습니다! 아이디가 없으실경우 신규 회원가입을 권장해 드립니다. </ul>
					<b>상태:로그아웃</b>
				</c:otherwise>
			</c:choose>			
		<hr />
		<li class="pagination pagination-sm justify-content-center">
		<a class="p-2 text-muted" href="/member/memberList">개인정보 수정</a>
		<a class="p-2 text-muted" href="/bbs/list">게시판 바로가기</a>		
		<a class="p-2 text-muted" href="javascript:alert('공사중')">내가 쓴 글목록</a>
		<a class="p-2 text-muted" href="javascript:alert('공사중')">Q&A</a>
		<a class="p-2 text-muted" href="javascript:alert('공사중')">개인정보이용약관</a>
		<a class="p-2 text-muted" href="javascript:alert('공사중')">협력업체홈페이지</a>
		<a class="p-2 text-muted" href="javascript:alert('공사중')">채용공고</a>
		<a class="p-2 text-muted" href="javascript:alert('공사중')">찾아오시는길</a>
		</li>
			
		</main><!-- /.container -->