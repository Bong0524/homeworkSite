<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.toggle3 input[type=radio]{
    display: none;
}
.toggle3 input[type=radio] + label {
    color: #e0e0e0;
    font-size: 5em;
}
.toggle3 input[type=radio]:checked + label {
    color: #000;
}</style>
</head>
<body>
<div class="toggle3">
    <input type="radio" id="toggle3-1" name="weather">
    <label for="toggle3-1">☀</label>
    <input type="radio" id="toggle3-2" name="weather">
    <label for="toggle3-2">☁</label>
    <input type="radio" id="toggle3-3" name="weather">
    <label for="toggle3-3">☂</label>
    <input type="radio" id="toggle3-4" name="weather">
    <label for="toggle3-4">☃</label>
</div> 
</body>
</html>