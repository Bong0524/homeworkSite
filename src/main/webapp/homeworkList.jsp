<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${empty homeworkList }">
	<jsp:forward page="homeworkList.do">
		<jsp:param value="all" name="filter"/>
	</jsp:forward>
</c:if>
<c:forEach items="${homeworkList }" var="homework">
	<div>
		<p>${homework.title }</p>
	</div>
</c:forEach>