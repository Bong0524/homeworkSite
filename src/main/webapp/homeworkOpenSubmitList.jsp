<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<h1 id="innerTitle" class="${homework.subject }">숙제 제출자 명단</h1>
<table border="1" style="border-collapse: collapse;">
	<tr>
		<th>이름</th>
		<th>번호</th>
		<th>제출일</th>
		<th>확인여부</th>
	</tr>
	<c:forEach items="${submitList }" var="submission">
		<tr style="text-align: center;" onclick="openHomework('${submission.homeworkId}','${submission.id}')">
			<td>${submission.name }</td>
			<td>${submission.num }</td>
			<td>${submission.subDate }</td>
			<td>${submission.confirm eq 1 ? "O" : "X"}</td>
		</tr>
	</c:forEach>
</table>
