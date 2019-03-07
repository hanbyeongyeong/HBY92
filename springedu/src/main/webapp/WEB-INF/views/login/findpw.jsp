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
.errmsg, pwErr {
	color: #f00;
}
</style>

<link rel="stylesheet"
	href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css" />

<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>


<script>
	$(function() {

		// 찾기버튼
		$("#findidbtn").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		});

		// 찾기취소버튼
		$("#findidcanclebtn").on("click", function(e) {
			e.preventDefault();
			location.href = "/";
		});

	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col offset-3">
				<form:form modelAttribute="mdto"
					action="${pageContext.request.contextPath }/login/findpw">

					<h2>[비밀번호 찾기]</h2>
					<ul>

						<div class="form-group row">
							<form:label path="id"
								class="col-sm-2 col-form-label col-form-label-sm">아이디</form:label>
							<form:input type="text" path="id"
								class="col-sm-3 form-control form-control-sm is-valid"
								placeholder="아이디를 입력하세요!" required="required" />
							<form:errors path="id" cssClass="col-sm-5 errmsg"></form:errors>
						</div>

						<div class="form-group row">
							<form:label path="tel"
								class="col-sm-2 col-form-label col-form-label-sm">전화번호</form:label>
							<form:input type="tel" path="tel"
								class="col-sm-3 form-control form-control-sm is-valid"
								placeholder="전화번호를 입력하세요 ex)010-1234-5678" required="true" />
							<form:errors path="tel" cssClass="col-sm-5 errmsg"></form:errors>
						</div>

						<div class="form-group row">
							<form:label path="birth"
								class="col-sm-2 col-form-label col-form-label-sm">생년월일</form:label>
							<form:input type="date" path="birth"
								class="col-sm-3 form-control form-control-sm is-valid"
								placeholder="생년월일을 입력하세요!" required="true" />
							<form:errors path="birth" cssClass="col-sm-5 errmsg"></form:errors>
						</div>

						<div class="form-group row">
							<div class="col-sm-2"></div>
							<div class="col-sm-4">
								<button class="btn btn-primary" type="submit" id="findidbtn">찾기</button>
								<button class="btn btn-primary" type="submit"
									id="findidcanclebtn">취소</button>
							</div>
							<div class="col-sm-2"></div>
						</div>

					</ul>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/main_footer.jsp" flush="false" />