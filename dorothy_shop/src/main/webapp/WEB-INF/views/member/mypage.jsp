<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    
    <!-- 회원가입 Bootstrap CSS -->
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
	  <!-- common.jsp -->
    <%@include file="/WEB-INF/views/include/common.jsp" %>
	
    <title>SwimLover_mypage</title>

	  <style>
	
      body {
        min-height: 80vh;
        background: #f0f0f0;

      }

      .input-form {
        max-width: 400px;

        margin-top: 100px;
        border-top: 150px;
        padding: 35px;
        padding-right: 35px;
        padding-left: 35px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      }
          
      .btn-link{
        text-decoration:none;
      }
      
      .p-2 {
  	text-decoration:none;
  }
    
    </style>
    
        <script>
      let msg = '${msg}';
      if(msg != '') {
        alert(msg);
      }

    </script>

    <!-- header.jsp -->
    <%@include file="/WEB-INF/views/include/header.jsp" %>

  </head>


  <body> 

    <div class="container">
  <h3>마이페이지</h3>
  <div class="mb-3 text-center">
		  <div class="row">
		    <label for="mem_id" class="col-sm-2 col-form-label">회원 가입일</label>
		    <div class="col-sm-5">
		      <span><fmt:formatDate value="${sessionScope.loginStatus.mem_date_sub }" pattern="yyyy-MM-dd hh:mm" />
		     </span>
		    </div>
		  </div>
		  <div class="row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">최근 로그인</label>
		    <div class="col-sm-5">
		      <span><fmt:formatDate value="${sessionScope.loginStatus.mem_date_last }" pattern="yyyy-MM-dd hh:mm" /></span>
		    </div>
		  </div>
		  <div class="row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">진행중 주문</label>
		    <div class="col-sm-5">
		      <span>${orderProcessCount} 개</span>
		    </div>
		  </div>
		  <div class="row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">장바구니</label>
		    <div class="col-sm-5">
		      <span>${cartProductCount} 개</span>
		    </div>
		  </div>
		  <div class="row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">총 주문금액</label>
		    <div class="col-sm-5">
		      <span>${odr_totalPrice }원 (배송완료 기준)</span>
		    </div>
		  </div>
		  <div class="row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">사용가능 포인트</label>
		    <div class="col-sm-5">
		      <span>${sessionScope.loginStatus.mem_point }원</span>
		    </div>
		  </div>
  </div>


    <!--  footer.jsp -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %> 

      
    <script>
    $(document).ready(function() {
        $("#btnSearchIDPW").on("click", function() {
          location.href = "/member/lostpass";
        });
      });
    
    </script>
  </body>
</html>