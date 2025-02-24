<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>find class</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"  rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findJandi/findJandiMain.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>
  
  <script>
  	$(function(){
  		
  		/* 셀렉트박스 선택 시 페이지 리로드 */
  		$("#searchCondition").on("change", function(){
  			$("#searchform").submit();
  		});

  		/* 페이지 리로드 시 셀렉트 박스 값 유지하기 */
  		$("#searchCondition").val("${ selectCriteria.searchCondition }");

  		/* 페이지 리로드 시 검색값 유지하기 */
  		$("#searchValue").val("${ selectCriteria.searchValue }");
  		
  	});
 	
  
  </script>
  
  <body>

    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
    <jsp:include page="../common/findJandisidebar.jsp" />
      
      <div class="container" style="width:75%; margin-top:150px">

  <!-- Page Heading -->
  <h1 class="my-4">멘토 보기 | 
    <small>전체 멘토</small>
  </h1>

  	<div class="row">
		<div class="row" style="margin-bottom:10px;">
			<div class="dropsearch">
			<form id="searchform" action="${ pageContext.servletContext.contextPath }/findJandi/findAllJandiMain" method="get" >
				<select class="ui dropdown" id="searchCondition" name="searchCondition" style="margin-left:120px; float:left; border-radius: 1.5rem;">
					<option value="1">최신순</option>
					<option value="2">인기순</option>
				</select>
		       	<div class="main-searchbox" style="width:350px;">
			        <input type="search" id="searchValue" name="searchValue" placeholder="찾으시는 잔디가 있으신가요?" value="<c:out value="${
						selectCriteria.searchValue }" />">
		          	<button type="submit">
		           		<img src="${ pageContext.servletContext.contextPath }/resources/images/research.png"/>
		         	</button>
				</div>
			</form>
		       	</div>
			  <br><br><br><br><br>
		</div>
		
	   <c:forEach var="jandi" items="${ jandiList }"> 
		    <div class="col-lg-4 col-sm-6 mb-4">
			      <div class="card">
			            <div class="card-body little-profi text-center">
			                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ jandi.profile_path }" alt="user"  
			                	onclick="location.href='${ pageContext.servletContext.contextPath}/findJandi/jandiProfile/${ jandi.email }'"></div>
			                <p>${ jandi.nickname }</p>
			            </div>
			      </div>
		    </div> 
	   </c:forEach>

  </div>
  <!-- /.row -->

  <!-- Pagination -->
	<jsp:include page="../common/Paging.jsp" />
</div>
    </div>
	
<!-- /.container -->

  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
