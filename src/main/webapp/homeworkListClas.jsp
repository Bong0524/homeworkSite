<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul {
	list-style: none;
	cursor: pointer;
}

.classList {
	cursor: pointer;
	padding-left: 20px;
	display: none;
}
</style>
<h1 style="color: white; background: rgb(69, 56, 40); padding: 10px 30px;">Class Homework</h1>
<section style="padding: 20px;">
	<c:forEach items="${homeworkList }" var="homework">
		<div>
			<p>${homework.title }</p>
		</div>
	</c:forEach>
</section>