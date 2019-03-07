<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/main_header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<style>

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
 	.errmsg, pwErr {
	color: #f00;
}
</style>

<link rel="stylesheet"
	href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css" />

<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>



</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col offset-3">
				<h2>[아이디 찾기 결과]</h2></br>
					<div class="form-group row">
				 <label path="id" class="col-sm-2 col-form-label col-form-label-sm">아이디:</label>
				 <label path="id" class="col-sm-3 form-control form-control-sm is-valid">${mdto.id }</label>
					</div>
 					
 					
				<div class="form-group row">
					<label class="col-sm-2 col-form-label col-form-label-sm"></label>
 					<button class="btn" ><a href="/login/findpwform">pw-찾기</a></button>
 					<button class="btn" ><a href="/login/loginForm">로그인-하러가기</a></button>
 				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/main_footer.jsp" flush="false" />