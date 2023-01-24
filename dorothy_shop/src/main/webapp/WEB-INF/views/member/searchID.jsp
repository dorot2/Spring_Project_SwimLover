<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>SwimLover_lostpass</title>
        
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    <%@include file="/WEB-INF/views/include/common.jsp" %>

	  <style>
	    body {
        min-height: 100vh;
        background: #f0f0f0;
      }
	    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .p-2 {
        text-decoration:none;
        word-spacing : 20px;
      }
      a {
        text-decoration:none;
      }
    </style>
    
    <script>
      let msg = '${msg}';
      if(msg != '') {
        alert(msg);
      }
    </script>
  </head>
  
  <body>
 
    <%@include file="/WEB-INF/views/include/header.jsp" %>
    <%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h3>아이디 찾기결과</h3>
    </div>

    <div class="container">
      <div class="mb-3 text-center row">
        <c:if test="${mem_id != null }">
          <p>ID : ${fn:substring(mem_id, 0, 4) }****</p><br>
          <p>전체 아이디는 고객센터로 문의해 주세요.</p>
        </c:if>
      </div>
      <p class="mb-1"></p><br><br><br><br>
    </div>
      
    <%@include file="/WEB-INF/views/include/footer.jsp" %>

    <script>
      //html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
      $(document).ready(function(){
      });
	  </script>
  </body>
</html>