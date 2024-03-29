<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String eventType = (String) request.getAttribute("eventType");
%>
<script>
$(document).ready(function() {
	
var className = "<%=eventType%>";

$("." + className).addClass("show active");

});
</script>
<div class="row">
	<div class="col-10 offset-1">
		<div class="row">
			<div class="col">
				<h1 class="mt-5 mb-4">이벤트</h1>
			</div>
			<c:if test="${sessionScope.userType == 'Admin'}">
				<div
					class="col d-flex align-items-end justify-content-end pb-4 pe-5">
					<a href="eventWriteForm" style="color: black;"><i
						class="bi bi-pencil">글쓰기</i></a>
				</div>
			</c:if>
		</div>
		<div class="row">
			<div class="col pe-0 ps-0">
				<nav>
					<div class="nav nav-tabs row border-top border-second border-4"
						id="nav-tab" role="tablist">
						<button class="nav-link active col-4 rounded-0 fs-4 eventtab"
							id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
							type="button" role="tab" aria-controls="nav-home"
							aria-selected="false"
							style="color: black; padding-top: 15px; padding-bottom: 15px; <%if (eventType.equals("Proceeding")) {%>opacity: 1;<%} else {%>opacity: 0.3;<%}%>"
							data-code="nav-home">진행중 이벤트</button>
						<button class="nav-link col-4 rounded-0 fs-4 eventtab"
							id="nav-profile-tab" data-bs-toggle="tab"
							data-bs-target="#nav-profile" type="button" role="tab"
							aria-controls="nav-profile" aria-selected="false"
							style="color: black; <%if (eventType.equals("Terminated")) {%>opacity: 1;<%} else {%>opacity: 0.3;<%}%>"
							data-code="nav-profile">종료된 이벤트</button>
						<button class="nav-link col-4 rounded-0 fs-4 eventtab"
							id="nav-contact-tab" data-bs-toggle="tab"
							data-bs-target="#nav-contact" type="button" role="tab"
							aria-controls="nav-contact" aria-selected="false"
							style="color: black; opacity: 0.3; <%if (eventType.equals("Winner")) {%>opacity: 1;<%} else {%>opacity: 0.3;<%}%>"
							data-code="nav-contact">당첨자 발표</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade Proceeding" id="nav-home" role="tabpanel"
						aria-labelledby="nav-home-tab" tabindex="0">
						<c:forEach var="Event" items="${currentEventList}">
							<div class="row mt-5 ps-5">
								<div class="col-4">
									<a href="currentEvent?eventno=${Event.eventno}&eventtitle=${Event.eventtitle}"><img src="resources/upload/${Event.eventimage}"
										alt="임시 이미지" style="width: 100%; height: 250px;"> </a>
								</div>
								<div class="col-8">
									<div class="row my-5">
										<div class="col">
											<h4>${Event.eventtitle}</h4>
										</div>
									</div>
									<div class="row mt-5">
										<div class="col">
											<h5 style="display: inline;">${Event.eventopendate}</h5>
											~
											<h5 style="display: inline;">${Event.eventclosedate}</h5>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="tab-pane fade Terminated" id="nav-profile"
						role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
						<div class="row">
							<div class="col">
								<c:forEach var="Event" items="${pastEventList}">
									<div class="row mt-5 ps-5">
										<div class="col-4">
										<a href="pastEvent?eventno=${Event.eventno}">
										<img src="resources/upload/${Event.eventimage}"
												alt="임시 이미지" style="width: 100%; height: 250px;"></a>
										</div>
										<div class="col-8">
											<div class="row my-5">
												<div class="col">
													<h4>${Event.eventtitle}</h4>
												</div>
											</div>
											<div class="row mt-5">
												<div class="col">
													<h5 style="display: inline;">${Event.eventopendate}</h5>
													~
													<h5 style="display: inline;">${Event.eventclosedate}</h5>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="tab-pane fade Winner" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab" tabindex="0">
						<div class="row border-bottom">
							<div class="col-2 text-center fs-5 pt-3 pb-3">No</div>
							<div class="col-5 text-center fs-5 pt-3 pb-3">제목</div>
							<div class="col-3 text-center fs-5 pt-3 pb-3">이벤트 기간</div>
							<div class="col-2 text-center fs-5 pt-3 pb-3">발표일</div>
						</div>
						<div class="row py-3 border-bottom">
							<div class="col-2 text-center fs-5">
								<span>200</span>
							</div>
							<div class="col-5 text-center fs-5">
								<span>카카오톡 이벤트 당첨자 발표</span>
							</div>
							<div class="col-3 text-center fs-5">
								<span>2023.12.01</span> ~ <span>2023.12.31</span>
							</div>
							<div class="col-2 text-center fs-5">
								<span>2024.01.01</span>
							</div>
						</div>
						<div class="row py-3 border-bottom">
							<div class="col-2 text-center fs-5">
								<span>199</span>
							</div>
							<div class="col-5 text-center fs-5">
								<span>카카오톡 이벤트 당첨자 발표</span>
							</div>
							<div class="col-3 text-center fs-5">
								<span>2023.11.01</span> ~ <span>2023.11.30</span>
							</div>
							<div class="col-2 text-center fs-5">
								<span>2023.12.01</span>
							</div>
						</div>
						<div class="row py-3 border-bottom">
							<div class="col-2 text-center fs-5">
								<span>198</span>
							</div>
							<div class="col-5 text-center fs-5">
								<span>카카오톡 이벤트 당첨자 발표</span>
							</div>
							<div class="col-3 text-center fs-5">
								<span>2023.10.01</span> ~ <span>2023.10.31</span>
							</div>
							<div class="col-2 text-center fs-5">
								<span>2023.11.01</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>