<%@page import="com.finalproject.festival.domain.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
    String id = (String) session.getAttribute("id");
    if (id != null) {
%>
    <form action="gallery" method="post" id="galleryidform">
        <input type="hidden" name="id" value="<%= id %>">
    </form>
<%
    } else {
%>
    <form action="gallery" method="post" id="galleryidform"></form>
<%
    }
%>
<% 
 
%>

<style type="text/css">
	a:link{text-decoration:none;}
	a:visited{text-decoration:none;}
	a:hover{ text-decoration:none;}
</style>
<script>
$(document).ready(function() {
    // Ajax 요청
    $.ajax({
        url: 'headerKeyword',
        type: 'GET',
        contentType: 'application/json; charset=UTF-8',
        success: function(data) {
            // 서버에서 받은 데이터를 이용하여 동적으로 HTML 업데이트
            updateSearchKeywords(data);
            console.log("data-----", data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log('Error:', jqXHR, textStatus, errorThrown);
        }
    });
});

function updateSearchKeywords(searchList) {
    // 받아온 데이터를 기반으로 HTML 업데이트
    var html = '';
    $.each(searchList, function(index, publicKeyword) {
    	if(index < 5){
        html += '<span class="mx-3"><a style="color: gray; text-decoration: underline;" href="mainSearch?searchWord='+publicKeyword.searchkeyword+'">' + publicKeyword.searchkeyword + '</a></span>';
    	}
    });

    // 결과를 적용할 요소에 HTML 삽입
    $('#headerKeyword').html(html);
}
</script>
<div class="row mt-5">
		<div class="col ">
		
			<div class="row offset-2">
				<div class="col-2 align-top">
					<a href="main">
						<img alt="" src="resources/img/logo.png" style="width: 120%;">
					</a>
				</div>
				<div class="col-7 ms-5 mt-3">
			 		<form class="d-flex" role="search" action="mainSearch">
			        <input class="form-control me-2 p-3" type="search" placeholder="Search" aria-label="Search" name="searchWord">
			        <button class="btn btn-outline-dark" type="submit">Search</button>
			        </form>
			        <div class="row mt-4">
						<div class="col-3 p-0 fw-bold text-end">인기 검색어  :</div>
						<div class="col p-0 text-start" id="headerKeyword">
							
				   		</div>
					</div>
				</div>
			</div>
			
			<div class="row mt-5">
				<div class="d-flex justify-content-around" >
					<nav class="navbar navbar-expand-lg bg-body-tertiary  ">
					  <div class="container-fluid "> 		
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
					    <div class="collapse navbar-collapse" id="navbarSupportedContent">
					      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
					        <li class="nav-item me-5">
					          <a class="nav-link active fs-5 fw-bold" aria-current="page" href="festivalMap">축제 지도</a>
					        </li>
					      
					        <li class="nav-item dropdown me-5">
					          <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					           	축제
					          </a>
					          
					          
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="news">축제 기사</a></li>
					            <li><a class="dropdown-item" href="productList">축제 정보</a></li>
					            <li><a class="dropdown-item" href="gallery" id="galleryPage">갤러리</a></li>
					          </ul>
					        </li>
					        <li class="nav-item dropdown me-5">
					          <a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					            	이벤트
					          </a>
					          
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="event?eventType=Proceeding">진행중 이벤트</a></li>
					            <li><a class="dropdown-item" href="event?eventType=Terminated">종료된 이벤트</a></li>
					         	<li><a class="dropdown-item" href="event?eventType=Winner">당첨자</a></li>
					          </ul>
					         </li>
					        <li class="nav-item dropdown me-5">
					        	<a class="nav-link dropdown-toggle fs-5 fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					            	고객센터
					          	</a>
					           
					          <ul class="dropdown-menu">
					          <li><a class="dropdown-item" href="customerMain">고객 센터</a></li>
					            <li><a class="dropdown-item" href="noticeMain">공지 사항</a></li>
					            <li><a class="dropdown-item" href="inquiryWrite">문의 하기</a></li>
					           	<li><a class="dropdown-item" href="informationUseMain">이용  안내</a></li>
					          </ul>
					        </li>
					        
							    <c:if test="${empty sessionScope.id}">
										<li class="nav-item ms-5">
								          <a href="login" class="row nav-link active p-0" aria-current="page"><i class="bi bi-person-circle p-0" style="font-size: 2em;"></i></a>
								        </li>
								</c:if>
								
					        <c:if test="${sessionScope.userType == 'Member' }">
								
									<li class="nav-item dropdown ms-5">
										<a class="nav-link dropdown-toggle p-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            		<i class="bi bi-person-lines-fill p-0" style="font-size: 2em;"></i>
						          		</a>
						           
							          <ul class="dropdown-menu">
							            <li><a class="dropdown-item" href="myPageMain?id=${sessionScope.id}">마이페이지</a></li>
							           	<li><a class="dropdown-item" href="basketRedirect">장바구니</a></li>
							           	<li><a class="dropdown-item" href="logout">로그아웃</a></li>
							          </ul>
							        </li>
								
					        </c:if>
					        
							<c:if test="${sessionScope.userType =='Admin' }">	
							
								<li class="nav-item dropdown me-5">
						        	<a class="nav-link dropdown-toggle p-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            	<i class="bi bi-gear-fill p-0" style="font-size: 2em;"></i>
						          	</a>
						           
						          <ul class="dropdown-menu">
						         	 <li><a class="dropdown-item" href="manageMain">관리자 페이지</a></li>
						            <li><a class="dropdown-item" href="logout">로그아웃</a></li>
						            
						           
						          </ul>
						        </li>
							
						     </c:if>  
						      
					     	</ul>
					    </div>
					  </div>
					</nav>
				</div>
			</div>	
		</div>
	</div>						