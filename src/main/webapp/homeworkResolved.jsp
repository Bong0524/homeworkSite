<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>

</style>
<h1 id="innerTitle" class="${homework.subject }">${homework.title }</h1>
<form id="questBox" name="resolveForm" action="homeworkSubmit.do" method="post">
	<input type="hidden" name="homeworkId" value="${homework.homeworkId }">
	<c:forEach var="quest" items="${questList }" varStatus="status">
		<c:choose>
			<%--오지선다 --%>
			<c:when test="${quest.kind eq 'five' }">
				<div style="display: flex; flex-wrap: wrap;" class="quest five">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
					<div style="display: flex; flex-wrap: wrap; margin: 10px auto; width: 95%;">
					
						<c:if test = "${submitList[status.index].answer eq '1'}">
							<c:set var="first" value="checked='checked'"/>
						</c:if>
						<c:if test = "${submitList[status.index].answer eq '2'}">
							<c:set var="second" value="checked='checked'"/>
						</c:if>
						<c:if test = "${submitList[status.index].answer eq '3'}">
							<c:set var="third" value="checked='checked'"/>
						</c:if>
						<c:if test = "${submitList[status.index].answer eq '4'}">
							<c:set var="fourth" value="checked='checked'"/>
						</c:if>
						<c:if test = "${submitList[status.index].answer eq '5'}">
							<c:set var="fifth" value="checked='checked'"/>
						</c:if>
					
						<input type="radio" value="1" name="${status.index }" id="${quest.questNum }-1" class="check" ${first } disabled="disabled">
						<label class="selectInQuest" for="${quest.questNum }-1">①${quest.first }</label>
						<input type="radio" value="2" name="${status.index }" id="${quest.questNum }-2" class="check" ${second } disabled="disabled">
						<label class="selectInQuest" for="${quest.questNum }-2">②${quest.second }</label>
						<input type="radio" value="3" name="${status.index }" id="${quest.questNum }-3" class="check" ${third } disabled="disabled">
						<label class="selectInQuest" for="${quest.questNum }-3">③${quest.third }</label>
						<input type="radio" value="4" name="${status.index }" id="${quest.questNum }-4" class="check" ${fourth } disabled="disabled">
						<label class="selectInQuest" for="${quest.questNum }-4">④${quest.fourth }</label>
						<input type="radio" value="5" name="${status.index }" id="${quest.questNum }-5" class="check" ${fifth } disabled="disabled">
						<label class="selectInQuest" for="${quest.questNum }-5">⑤${quest.fifth }</label>
						
						<%-- 다음문제를 위한 변수 초기화 --%>
						<c:remove var="first"/>
						<c:remove var="second"/>
						<c:remove var="third"/>
						<c:remove var="fourth"/>
						<c:remove var="fifth"/>
					</div>
				</div>
			</c:when>
			<%--다답형 --%>
			<c:when test="${quest.kind eq 'four' }">
				<div style="display: flex; flex-wrap: wrap;" class="quest four">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
					<div style="display: flex; flex-wrap: wrap; margin: 10px auto; width: 95%; border: 1px solid black; padding: 5px;">
						
					
						<c:if test = "${fn:contains(submitList[status.index].answer, 'ㄱ')}">
							<c:set var=">giuk" value="checked='checked'"/>
						</c:if>
						<c:if test = "${fn:contains(submitList[status.index].answer, 'ㄴ')}">
							<c:set var="nieun" value="checked='checked'"/>
						</c:if>
						<c:if test = "${fn:contains(submitList[status.index].answer, 'ㄷ')}">
							<c:set var="digud" value="checked='checked'"/>
						</c:if>
						<c:if test = "${fn:contains(submitList[status.index].answer, 'ㄹ')}">
							<c:set var="rieul" value="checked='checked'"/>
						</c:if>
					
						<input type="checkbox" value="ㄱ" name="${status.index }" id="${quest.questNum }-1" class="check" ${giuk } disabled="disabled">
						<label class="selectInQuest" for="${quest.questNum }-1">ㄱ. ${quest.first }</label>
						<input type="checkbox" value="ㄴ" name="${status.index }" id="${quest.questNum }-2" class="check" ${nieun } disabled="disabled">	
						<label class="selectInQuest" for="${quest.questNum }-2">ㄴ. ${quest.second }</label>
						<input type="checkbox" value="ㄷ" name="${status.index }" id="${quest.questNum }-3" class="check" ${digud } disabled="disabled">	
						<label class="selectInQuest" for="${quest.questNum }-3">ㄷ. ${quest.third }</label>
						<input type="checkbox" value="ㄹ" name="${status.index }" id="${quest.questNum }-4" class="check" ${rieul } disabled="disabled">	
						<label class="selectInQuest" for="${quest.questNum }-4">ㄹ. ${quest.fourth }</label>
						
						<%-- 다음문제를 위한 변수 초기화 --%>
						<c:remove var="giuk"/>
						<c:remove var="nieun"/>
						<c:remove var="digud"/>
						<c:remove var="rieul"/>
						
					</div>
				</div>
			</c:when>
			<%--단답형 --%>
			<c:when test="${quest.kind eq 'short' }">
				<div class="quest short">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
					<input type="text" class="answer" name="${status.index }" value="${submitList[status.index].answer}" disabled="disabled">
				</div>
			</c:when>
			<%--서술형 --%>
			<c:when test="${quest.kind eq 'long' }">
				<div class="quest long">
					<span style="word-break: keep-all;">${status.count }. ${quest.quest }</span>
					<div class="questImageBox"></div>
					<textarea class="answer" name="${status.index }" disabled="disabled">${submitList[status.index].answer }</textarea>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
	<button class="resolveBtn" onclick="clickMenu('All'); return false;">돌아가기</button>
</form>
<script type="text/javascript">
</script>