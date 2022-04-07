<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav style="height: 100vh; width: 250px; padding: 10px;">
	<header>
		<img alt="로고" src="img/logo.png" width="100%">
	</header>
	<ul style="font-weight: bold;">
		<li onclick="clickMenu('All')">홈페이지</li>
		<li>우리학급</li>
		<li>마이페이지</li>
		<li><p class="openClassList">학급</p>
			<ul class="classList" style="font-weight: normal;">
				<li><p class="openClassList">1학년</p>
					<ul class="classList">
						<c:forEach items="${classList }" var="clas">
							<c:if test="${clas.grade eq 1 }">
								<li onclick="clickMenu('Clas',${clas.grade},${clas.clas })">
									${clas.clas }반
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li><p class="openClassList">2학년</p>
					<ul class="classList">
						<c:forEach items="${classList }" var="clas">
							<c:if test="${clas.grade eq 2 }">
								<li onclick="clickMenu('Clas',${clas.grade},${clas.clas })">
									${clas.clas }반
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li><p class="openClassList">3학년</p>
					<ul class="classList">
						<c:forEach items="${classList }" var="clas">
							<c:if test="${clas.grade eq 3 }">
								<li onclick="clickMenu('Clas',${clas.grade},${clas.clas })">
									${clas.clas }반
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li><p class="openClassList">4학년</p>
					<ul class="classList">
						<c:forEach items="${classList }" var="clas">
							<c:if test="${clas.grade eq 4 }">
								<li onclick="clickMenu('Clas',${clas.grade},${clas.clas })">
									${clas.clas }반
								</li>
							</c:if>
						</c:forEach>	
					</ul>
				</li>
				<li><p class="openClassList">5학년</p>
					<ul class="classList">
						<c:forEach items="${classList }" var="clas">
							<c:if test="${clas.grade eq 5 }">
								<li onclick="clickMenu('Clas',${clas.grade},${clas.clas })">
									${clas.clas }반
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li><p class="openClassList">6학년</p>
					<ul class="classList">
						<c:forEach items="${classList }" var="clas">
							<c:if test="${clas.grade eq 6 }">
								<li onclick="clickMenu('Clas',${clas.grade},${clas.clas })">
									${clas.clas }반
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</nav>
<script type="text/javascript">
clickMenu("All");
function clickMenu(f,g,c) {
	$("#section").load("homeworkList.do", {filter : f, grade : g, clas : c})
}
</script>