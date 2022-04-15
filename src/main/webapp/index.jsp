<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴먼초등학교 숙제마당</title>
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

#section{
	margin: 10px 0; 
	background-color: white; 
	border-radius: 7px; 
	overflow: hidden; 
	box-shadow: #ccc 0px 0px 10px 1px; 
	width: 1120px; 
	z-index: 3;
}
.classList {
	cursor: pointer;
	padding-left: 20px;
	display: none;
}
.bookmarkDiv{
	cursor: pointer;
	margin-left: -20px;
	height: 200px; 
	width: 50px;
	display: inline-block;
	transform: rotate(270deg);
	position: absolute; 
}
.bookmarkImg{
	display: block;
	width: 100%;
	height: 100%;
}
.bookmarkP{
	z-index: 2; 
	position: absolute; 
	bottom: 30%; 
	color: white; 
	font-weight: bold;
	left: 50%;
	transform: translateX(-50%) rotate(90deg); 
	width: max-content;
}
#innerTitle{
	color: white; 
	padding: 10px 30px;
	height: 6%;
	font-size: 25px;
}
.brown{
	background: rgb(69, 56, 40); 
}
.korean{
	background-color: #ce6879;
}
.english{
	background-color: #f2c558;
}
.math{
	background-color: #7f9a40;
}
.science{
	background-color: #2c8c82;
}
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
.selectInQuest{
	min-width: 50%;
	word-break: keep-all;
}
#questBox{
	display: flex; 
	font-size: 20px; 
	margin: 0 auto; 
	width: 1010px; 
	align-content: space-around; 
	flex-direction: column; 
	flex-wrap: wrap; 
	padding: 50px 0 70px 0; 
	height: 94%;
	position: relative;
}
.resolveBtn{
	background: rgb(69, 56, 40);
	bottom: 20px;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	padding: 10px 20px;
	color: white;
	border-radius: 4px;
	border: none;
	font-weight: bolder;
    cursor: pointer;
}
.quest{
	width: 480px; 
	position: relative;
}
.quest.five, .quest.four{
	margin-bottom: 30px;
}
.quest.short{
	margin-bottom: 60px;
}
.quest.long{
	margin-bottom: 100px;
}
.short input[type="text"]{
	position: absolute;
	bottom: -40px;
	border: none;
	border-bottom: 1px solid black;
	outline: none;
	font-size: 19px;
}
.long textarea{
	position: absolute;
	bottom: -90px;
	height: 80px;
	border: 1px solid black;
	outline: none;
	font-size: 15px;
	width: 100%;
	resize: none;
}
label {
	cursor: pointer;
}
.quest .check{
	display: none;
}
.check:checked + label {
    color: blue;
}
/* https://610e2c3380568900398f148d-ulwliiyqae.chromatic.com/?path=/docs/chunks-participants--default */
/* https://www.flaticon.com/kr/packs/back-to-school-83 */
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body style="display: flex; background: rgb(246, 249, 252); height: 100vh">
	<jsp:include page="menuLeft.jsp"/>
	<section id="section"></section>
	<jsp:include page="menuRight.jsp"/>
	<script type="text/javascript">
	clickMenu('All');
	function clickMenu(f,g,c) {
		$("#section").load("homeworkList.do", {filter : f, grade : g, clas : c});
	}
	function openHomework(homeworkId) {
		$("#section").load("homeworkOpen.do", {homeworkId : homeworkId, how : "open"});
	}
	function resolveHomework(homeworkId) {
		$("#section").load("homeworkOpen.do", {homeworkId : homeworkId, how : "resolve"});
	}
	
	function subjectBookMark() {
		$("#homeworkBookMark").css("display","none");
		$("#subjectBookMark").css("display","block");
	}
	function homeworkBookMark() {
		$("#subjectBookMark").css("display","none");
		$("#homeworkBookMark").css("display","block");
	}
	</script>
</body>
</html>