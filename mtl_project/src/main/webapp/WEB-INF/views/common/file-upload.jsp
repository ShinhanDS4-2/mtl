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
	<h1>[임시] 사진 여러 장 업로드</h1>
	<form action="/mtl/upload" method="post" enctype="multipart/form-data">
        <label for="type">이미지 종류:</label>
        <select id="type" name="type" required>
            <option value="A">맛집</option>
            <option value="R">관광지</option>
        </select>
        <br><br>
        
        <label for="name">이미지 이름:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        
        <label for="area">지역:</label>
        <input type="text" id="area" name="area" required>
        <br><br>
        
        <label for="address">주소:</label>
        <input type="text" id="address" name="address" required>
        <br><br>
        
        <label for="latitude">위도:</label>
        <input type="number" id="latitude" name="latitude" step="0.000001" required>
        <br><br>
        
        <label for="hardness">경도:</label>
        <input type="number" id="hardness" name="hardness" step="0.000001" required>
        <br><br>
        
        <label for="description">이미지 설명:</label>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea>
        <br><br>
        
        <label for="addressSi">주소(시):</label>
        <input type="text" id="addressSi" name="addressSi" required>
        <br><br>
        
        <label for="addressDong">주소(동):</label>
        <input type="text" id="addressDong" name="addressDong" required>
        <br><br>
        
        <label for="file">이미지 선택:</label>
        <input type="file" id="file" name="file" multiple required>
        <br><br>
        
        <button type="submit">업로드</button>
    </form>
</body>
</html>