<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<style>
</style>
<h1 id="innerTitle" class="${homework.subject }">${homework.title }</h1>
<div id="questBox">
	<c:forEach items="${questList }" var="quest" varStatus="status">
		<c:choose>
			<%--오지선다 --%>
			<c:when test="${quest.kind eq 'five' }">
				<div style="display: flex; flex-wrap: wrap;" class="quest five">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
					<div style="display: flex; flex-wrap: wrap; margin: 10px auto; width: 95%;">
						<span class="selectInQuest">①${quest.first }</span>
						<span class="selectInQuest">②${quest.second }</span>
						<span class="selectInQuest">③${quest.third }</span>
						<span class="selectInQuest">④${quest.fourth }</span>
						<span class="selectInQuest">⑤${quest.fifth }</span>
					</div>
				</div>
			</c:when>
			<%--다답형 --%>
			<c:when test="${quest.kind eq 'four' }">
				<div style="display: flex; flex-wrap: wrap;" class="quest four">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
					<div style="display: flex; flex-wrap: wrap; margin: 10px auto; width: 95%; border: 1px solid black; padding: 5px;">
						<span class="selectInQuest">ㄱ. ${quest.first }</span>
						<span class="selectInQuest">ㄴ. ${quest.second }</span>
						<span class="selectInQuest">ㄷ. ${quest.third }</span>
						<span class="selectInQuest">ㄹ. ${quest.fourth }</span>
					</div>
				</div>
			</c:when>
			<%--단답형 --%>
			<c:when test="${quest.kind eq 'short' }">
				<div class="quest short">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
				</div>
			</c:when>
			<%--서술형 --%>
			<c:when test="${quest.kind eq 'long' }">
				<div class="quest long">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
	<button class="resolveBtn" onclick="resolveHomework('${homework.homeworkId}')">문제풀기</button>
</div>
<script type="text/javascript">
	$("#subjectBookMark").css("display","none");
</script>