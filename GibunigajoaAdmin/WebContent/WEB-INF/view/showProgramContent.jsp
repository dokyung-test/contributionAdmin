<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function updateApprovalFlg(approval_flg){

		var program_id = document.getElementById("program_id").value;
		var organization_id = document.getElementById("organization_id").value;
		$.ajax({
			type : "post",
			url : "updateApprovalFlg.do",
			data : "organization_id="+organization_id+"&program_id="+program_id+"&approval_flg="+approval_flg,
			dataType : "html"
		}).done(function(args){
			if(args == 0){
				alert("승인 에러!");
			}else{
				window.location = '/Sample/admin/programList.do'
			}
		}).fail(function(e){
			alert(e.responseText);	
		})
	}
	
</script>
</head>
<body>
<table>
<form:form commandName="requestProgram" action="/Sample/admin/updateApproval.do">
 <input type = "hidden" id = "organization_id" name = "organization_id" value = "${requestProgram.organization_id}"/>
 <input type = "hidden" id = "program_id" name = "program_id" value = "${requestProgram.program_id}"/>
<tr><td>프로그램명 : </td><td>${requestProgram.program_subject}</td></tr>
<tr><td>분류 : </td><td>${typeValue}</td></tr>
<tr><td>모집시작일  : </td><td>${requestProgram.start_date}</td></tr>
<tr><td>모집종료일 : </td><td>${requestProgram.end_date}</td></tr>
<tr><td>목표금액 : </td><td>${requestProgram.target_amount }</td></tr>
<tr><td>모집목적 : </td><td>${requestProgram.purpose}</td></tr>
<tr><td>모집내용(요약) : </td><td>${requestProgram.summary}</td></tr>
<tr><td>모집내용(상세) : </td><td>${requestProgram.content}</td></tr>
<tr><td>단체URL : </td><td>${requestProgram.organization_url}</td></tr>
<tr><td>은행명 : </td><td>${requestProgram.bank_name}</td></tr>
<tr><td>계좌번호 : </td><td>${requestProgram.account}</td></tr>
<tr><td>사업자등록번호 : </td><td>${requestProgram.corporate_registration_number}</td></tr>
<!-- form안에 버튼은 type을 지정해주지 않으면 default submit으로 움직인다. type을 지정해줄것! -->
<tr><td>우편번호 : </td><td>${requestProgram.zip}</td></tr>
<tr><td>주소 : </td><td>${requestProgram.address}</td></tr>
<tr><td>상세주소 : </td><td>${requestProgram.address_detail}</td></tr>
<tr><td>연락처 : </td><td>${requestProgram.phone_number}</td></tr>
<tr><td>대표자명 : </td><td>${requestProgram.representative}</td></tr>
<c:choose>
	<c:when test="${requestProgram.approval_flg == 1 }">
<tr><td>
<c:if test="${!empty requestProgram.banner_file_name}">
<img width = "250" height="250" src="${pageContext.request.contextPath}/resources/images/${requestProgram.banner_file_name}">
</c:if>
</td></tr>	</c:when>
</c:choose>
<tr><td>
	<c:choose>
	<c:when test="${requestProgram.approval_flg == 0 }">
	<form:button type = "button" onclick = "updateApprovalFlg(1)">승인</form:button>
	</c:when>
	<c:when test="${requestProgram.approval_flg == 1 }">
	<form:button type = "button" onclick = "updateApprovalFlg(0)">승인취소</form:button>
	</c:when>
	</c:choose>
<form:button type = "button" onclick = "window.location='/Sample/admin/programList.do'">목록으로</form:button>
</td></tr></form:form>
</table>
</body>
</html>