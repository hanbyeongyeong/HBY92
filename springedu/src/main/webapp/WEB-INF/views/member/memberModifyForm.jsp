<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<jsp:include page="/main_header.jsp" flush="false"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<style>
	.errmsg, pwErr {color: #f00;}
</style>            

<link rel="stylesheet" href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css" />

<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.2.1/js/bootstrap.min.js"></script>


<script>
	$(function(){
		
		$(function(){
			
			//유효성체크 오류시 에러표시 css적용 
			$(".errmsg").each(function(idx){
				if($(this).text().length > 0){
					 $(this).prev().removeClass("is-valid").addClass("is-invalid");
				}
			});	
		
					
		$("#pw,#pwchk").on("keyup",function(){
			if($("#pw").val() != $("#pwchk").val()) {
				console.log($(this).val());
				$(".pwErr").text('비밀번호가 틀립니다!');
				$(this).focus();
			}else{
				$(".pwErr").text('');
			}
		})
		
		// 수정버튼
		$("#modifyBtn").on("click",function(e){
			e.preventDefault();	
			$("form").submit();
		});
				
		// 수정취소버튼
		$("#modifyCancelBtn").on("click",function(e){
			e.preventDefault();	
			location.href="/member/memberList";
		});
		
	});
</script>
</head>
<body>
<%-- 	<form:form modelAttribute="mdto" action="memberJoin"> --%>
	<%-- <form:form modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberModify">
		                                       
		<h2 style="margin-left:800px;">[회원수정]</h2>
		<ul style="margin-left:800px;">
			<li>
				<form:label path="id">아이디</form:label>
				<form:input type="text" path="id" readonly="true"/>
				<form:errors path="id" cssClass="errmsg"></form:errors>
			</li>
			<li>
				<form:label path="pw">비밀번호</form:label>
				<form:input type="password" path="pw" />
				<form:errors path="pw" cssClass="errmsg"></form:errors>
			</li>
			<li>
				<label for="pwchk">비밀번호확인</label>
				<input type="password" id="pwchk" name='pwchk' />
				<span class="pwErr"></span>				
			</li>
			<li>
				<form:label path="tel">전화번호</form:label>
				<form:input type="tel" path="tel" />
				<form:errors path="tel" cssClass="errmsg"></form:errors>
			</li>
			<li>
				<form:label path="nickName">닉네임</form:label>
				<form:input type="text" path="nickName" />
				<form:errors path="nickName" cssClass="errmsg"></form:errors>
			</li>
			<li>
				<form:label path="gender">성별</form:label>
				<form:radiobutton path="gender" value="남"/>남자
				<form:radiobutton path="gender" value="여"/>여자

 				<form:radiobuttons items="${gender }" path="gender" itemLabel="label" itemValue="code"/>
 			</li>

			<li><form:label path="region">지역</form:label>
					<form:select path="region">
            <form:option value="" label="--지역선택--"/>
            <form:options items="${rCodes }" itemLabel="label" itemValue="code"/>						
					</form:select>
			</li>			
			<li>
				<form:label path="birth">생년월일</form:label>
				<form:input type="date" path="birth" />
				<form:errors path="birth" cssClass="errmsg"></form:errors>
			</li>
			<button id="modifyBtn">수정</button>
					<button id="modifyCancelBtn">취소</button>
			
		</ul>
	</form:form> --%>
	<div class="container">
	<div class="row">
	<div class="col offset-3">
	<form:form modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberModify">
	
	<h2>[회원수정]</h2></br>
  
  <div class="form-group row">
    <form:label path="id" class="col-sm-2 col-form-label col-form-label-sm">아이디</form:label>
    <form:input type="text" path="id" class="col-sm-3 form-control form-control-sm is-valid" placeholder="아이디를 입력하세요!" required="required" readonly="true"   />
 		<form:errors path="id" cssClass="col-sm-5 errmsg"></form:errors>
  </div>
  <div class="form-group row ">
    <form:label path="pw" class="col-sm-2 col-form-label col-form-label-sm">비밀번호</form:label>
    <form:input type="password" path="pw" class="col-sm-3 form-control form-control-sm is-valid" placeholder="비밀번호를 입력하세요!" required="required"/>
		<form:errors path="pw" cssClass="col-sm-5 errmsg"></form:errors>
  </div>  
  <div class="form-group row">
    <label for="pwchk" class="col-sm-2 col-form-label col-form-label-sm">비밀번호확인</label>
    <input type="password" id="pwchk" class="col-sm-3 form-control form-control-sm is-valid" placeholder="비밀번호를 입력하세요!" required/>
		<span class="col-sm-5 pwErr"></span>
  </div> 
  <div class="form-group row">
    <form:label path="tel" class="col-sm-2 col-form-label col-form-label-sm">전화번호</form:label>
	  <form:input type="tel" path="tel" class="col-sm-3 form-control form-control-sm is-valid" placeholder="전화번호를 입력하세요 ex)010-1234-5678" required="true"/>
		<form:errors path="tel" cssClass="col-sm-5 errmsg"></form:errors>
  </div>
  <div class="form-group row">
    <form:label path="nickName" class="col-sm-2 col-form-label col-form-label-sm">닉네임</form:label>    
    <form:input type="text" path="nickName" class="col-sm-3 form-control form-control-sm is-valid" placeholder="별칭을 입력하세요!" required="true"/>
		<form:errors path="nickName" cssClass="col-sm-5 errmsg"></form:errors>
  </div>
  <div class="form-group row">
    <form:label path="gender" class="col-sm-2 col-form-label col-form-label-sm">성 별</form:label> 
    <form:radiobuttons delimiter="&nbsp;&nbsp;&nbsp;" items="${gender }" path="gender" itemLabel="label" itemValue="code"/>
  </div>
  <div class="form-group row">

       <form:label path="region" class="col-sm-2 col-form-label col-form-label-sm">지역</form:label>
       <form:select path="region" class="col-sm-3 form-control form-control-sm is-valid">
       <option value="" >--지역선택--</option>       	
       <form:options path="region" items="${rCodes }" itemLabel="label" itemValue="code" />
       </form:select>	
<!--        <div class="valid-feedback">
        Looks good!
      </div> -->
  </div>  
  <div class="form-group row">
    <form:label path="birth" class="col-sm-2 col-form-label col-form-label-sm">생년월일</form:label>
    <form:input type="date" path="birth" class="col-sm-3 form-control form-control-sm is-valid" placeholder="생년월일을 입력하세요!" required="true"/>
		<form:errors path="birth" cssClass="col-sm-5 errmsg"></form:errors>
  </div>  	
  <div class="form-group row" >
    <div class="col-sm-2"></div>
		<div class="col-sm-4">
		
		<button class="btn btn-primary"  id="modifyBtn">수정</button>
		<button class="btn btn-primary"  id="modifyCancelBtn">취소</button>
	

		</div>
		<div class="col-sm-2" ></div>
	</div>
</form:form>
</div></div></div>
</body>
</html>
<jsp:include page="/main_footer.jsp" flush="false" />