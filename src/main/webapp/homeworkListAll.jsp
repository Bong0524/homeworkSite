<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style type="text/css">
.classList {
	cursor: pointer;
	padding-left: 20px;
	display: none;
}
.remain{
	padding: 5px;
}
.end{
	background: #ccc;
}
.tight{
	background: #ff8383;
}
.middle{
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
	cursor: pointer;
}
#homeworkList{
	padding: 20px; 
	display: flex; 
	flex-wrap: wrap;
}
.homework:nth-child(5n+0){
	margin-right: 0;
}
.homeworkTitle{
	padding: 5px;
	color: white;
}
</style>
<h1 style="color: white; background: rgb(69, 56, 40); padding: 10px 30px;">HOME</h1>
<c:set var="todayInt" value="<%=new java.util.Date().getTime()%>" />
<div id="homeworkList">
	<c:forEach items="${homeworkList }" var="homework">
		<div class="homework">
			<c:choose>
				<c:when test="${homework.subject eq 'korean'}">
					<h2 style="background-color: #ce6879;" class="homeworkTitle">${homework.title }</h2>
				</c:when>
				<c:when test="${homework.subject eq 'english'}">
					<h2 style="background-color: #f2c558;" class="homeworkTitle">${homework.title }</h2>
				</c:when>
				<c:when test="${homework.subject eq 'math'}">
					<h2 style="background-color: #7f9a40;" class="homeworkTitle">${homework.title }</h2>
				</c:when>
				<c:when test="${homework.subject eq 'science'}">
					<h2 style="background-color: #2c8c82;" class="homeworkTitle">${homework.title }</h2>
				</c:when>
			</c:choose>
			<div style="overflow: hidden; position: relative;">
				<img alt="과목이미지" src="img/${homework.subject}.png" width="200px;" style="padding: 10px;">
			</div>
			<c:choose>
				<c:when test="${homework.timeout <= 0 }"><p class="end remain">마감</p></c:when>
				<c:when test="${homework.timeout <= 1 }"><p class="tight remain">오늘까지!!</p></c:when>
				<c:when test="${homework.timeout <= 3 }"><p class="middle remain">
					${homework.timeout }일 남았어요!</p>
				</c:when>
				<c:otherwise><p class="free remain">${homework.enDate}까지</p></c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
</div>
<script type="text/javascript">
	function clickMark(s) {
		$("#section").load("homeworkList.do", {filter : "${filter}", grade : "${grade}", clas : "${clas}", subject : s})
	}
</script>
