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
		<jsp:forward page="ClassListPro"/>
	</c:if>
	<jsp:include page="menuSide.jsp"/>
	<div id="section" style="margin: 10px 0; background-color: white; border-radius: 7px; overflow: hidden; box-shadow: #ccc 0px 0px 10px 1px; width: 1120px;">
	</div>
	<script type="text/javascript">
	clickMenu("All");
	$(".openClassList").click(function() {
		if ($(this).next().css("display") == "none")
			$(this).next().css("display", "inline-block");
		else
			$(this).next().css("display", "none");
	})
	</script>
</body>
</html>