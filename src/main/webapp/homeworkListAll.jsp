<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.homeworkTitle{
	position: absolute; 
	top: 50%; 
	left: 50%; 
	transform: translate(-50%, -50%); 
	color: white;
}
.remain{
	padding: 5px;
}
.end{
	background: #ccc;
}
.tight{
	background: #fff783;
}
.free{
	background: #bbff66;
}
.homework{
	border: 1px solid black; 
	border-radius: 3px;
	margin-right: 20px;
	margin-bottom: 20px;
	width: 200px;
}
#homeworkList{
	padding: 20px; 
	display: flex; 
	flex-wrap: wrap;
}
.homework:nth-child(5n+0){
	margin-right: 0;
}
</style>
<h1 style="color: white; background: rgb(69, 56, 40); padding: 10px 30px;">HOME</h1>
<c:if test="${empty homeworkList}">
	<jsp:forward page="homeworkList.do">
		<jsp:param value="All" name="filter"/>
	</jsp:forward>
</c:if>
<c:set var="todayInt" value="<%=new java.util.Date().getTime()%>" />
<div id="homeworkList">
	<c:forEach items="${homeworkList }" var="homework">
		<fmt:parseNumber var="time" value="${(homework.enDate.time - todayInt)/1000/60/60}" integerOnly="true"/>
		<div class="homework">
			<c:choose>
				<c:when test="${homework.subject eq 'math'}">
					<h2 style="background-color: #80ff80; padding: 5px;">${homework.title }</h2>
				</c:when>
				<c:when test="${homework.subject eq 'science'}">
					<h2 style="background-color: #6495ed; padding: 5px;">${homework.title }</h2>
				</c:when>
				<c:when test="${homework.subject eq 'korean'}">
					<h2 style="background-color: #ffd700; padding: 5px;">${homework.title }</h2>
				</c:when>
				<c:when test="${homework.subject eq 'english'}">
					<h2 style="background-color: #ff9500; padding: 5px;">${homework.title }</h2>
				</c:when>
			</c:choose>
			<div style="overflow: hidden; position: relative;">
				<img alt="과목이미지" src="img/${homework.subject}.png" width="200px;" style="padding: 10px;">
			</div>
			<c:choose>
				<c:when test="${time <= 0 }"><p class="end remain">마감</p></c:when>
				<c:when test="${time <= 3*24 }"><p class="tight remain">
					<fmt:parseNumber var="day" value="${(time/24)+(1-((time/24)%1))%1}" integerOnly="true" />
					${day }일 남았어요!</p>
				</c:when>
				<c:otherwise><p class="free remain">${homework.enDate}까지</p></c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
</div>
