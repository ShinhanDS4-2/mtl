<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!-- page css -->
</head>
<body>
	<h1>Upload Results</h1>
    <ul>
        <c:forEach var="message" items="${messages}">
            <li>${message}</li>
        </c:forEach>
    </ul>

</body>
</html>