<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴먼초등학교 숙제 게시판</title>
<link rel="icon" href="img/favicon.ico">
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
/* https://610e2c3380568900398f148d-ulwliiyqae.chromatic.com/?path=/docs/chunks-participants--default */
/* https://www.flaticon.com/kr/packs/back-to-school-83 */
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body style="display: flex; background: rgb(246, 249, 252)">
	<c:if test="${empty classList}">
		<jsp:forward page="ClassListPro" />
	</c:if>
	<nav style="height: 100vh; width: 250px; padding: 10px;">
		<header>
			<img alt="로고" src="img/logo.png" width="100%">
		</header>
		<ul style="font-weight: bold;">
			<li>홈페이지</li>
			<li>우리반</li>
			<li>마이페이지</li>
			<li><p class="openClassList">학급</p>
				<ul class="classList" style="font-weight: normal;">
					<li><p class="openClassList">1학년</p>
						<ul class="classList">
							<c:forEach items="${classList }" var="clas">
								<c:if test="${clas.grade eq 1 }">
									<li>${clas.clas }반</li>
								</c:if>
							</c:forEach>
						</ul></li>
					<li><p class="openClassList">2학년</p>
						<ul class="classList">
							<c:forEach items="${classList }" var="clas">
								<c:if test="${clas.grade eq 2 }">
									<li>${clas.clas }반</li>
								</c:if>
							</c:forEach>
						</ul></li>
					<li><p class="openClassList">3학년</p>
						<ul class="classList">
							<c:forEach items="${classList }" var="clas">
								<c:if test="${clas.grade eq 3 }">
									<li>${clas.clas }반</li>
								</c:if>
							</c:forEach>
						</ul></li>
					<li><p class="openClassList">4학년</p>
						<ul class="classList">
							<c:forEach items="${classList }" var="clas">
								<c:if test="${clas.grade eq 4 }">
									<li>${clas.clas }반</li>
								</c:if>
							</c:forEach>
						</ul></li>
					<li><p class="openClassList">5학년</p>
						<ul class="classList">
							<c:forEach items="${classList }" var="clas">
								<c:if test="${clas.grade eq 5 }">
									<li>${clas.clas }반</li>
								</c:if>
							</c:forEach>
						</ul></li>
					<li><p class="openClassList">6학년</p>
						<ul class="classList">
							<c:forEach items="${classList }" var="clas">
								<c:if test="${clas.grade eq 6 }">
									<li>${clas.clas }반</li>
								</c:if>
							</c:forEach>
						</ul></li>
				</ul>
			</li>
		</ul>
	</nav>
	<div
		style="margin: 10px; background-color: white; border-radius: 7px; overflow: hidden; box-shadow: #ccc 0px 0px 10px 1px; flex: 1">
		<h1
			style="color: white; background: rgb(69, 56, 40); padding: 10px 30px;">HOME</h1>
		<section style="padding: 20px;">
			<jsp:include page="homeworkList.jsp"/>
		</section>
	</div>
	<script type="text/javascript">
		console.log()
		$(".openClassList").click(function() {
			if ($(this).next().css("display") == "none")
				$(this).next().css("display", "inline-block");
			else
				$(this).next().css("display", "none");
		})
	</script>
</body>
</html>