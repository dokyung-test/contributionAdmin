<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<table border = "1">
	<tr>
		<th>프로그램제목</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>승인상태</th>
		
	</tr>
	
	<c:if test="${!empty programList}">
		<c:forEach var = "requestProgram" items="${programList}">
			<tr>
				<td><a href = "/Sample/admin/showProgramContent.do?program_id=${requestProgram.program_id}&organization_id=${requestProgram.organization_id}">${requestProgram.program_subject}</a></td>
				<td><fmt:formatDate value="${requestProgram.start_date}" pattern = "yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${requestProgram.end_date}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${requestProgram.approval_flg == 0}">미승인</c:if>
					<c:if test="${requestProgram.approval_flg == 1}">승인</c:if>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty programList }">
	<tr>
		<td rowspan="4">신청한 프로그램이 없습니다.</td>
	</tr>
	</c:if>
</table>
</body>
</html>