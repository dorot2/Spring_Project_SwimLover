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
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    
      
	  <!-- common.jsp -->
    <%@include file="/WEB-INF/views/include/common.jsp" %>
	
    <title>SwimLover_mypage</title>

	  <style>
	
      body {
        min-height: 120vh;
        background: #f0f0f0;

      }

      .input-form {
        max-width: 800px;

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
      .col-sm-3 {
      	color : black;
      	text-align : center;
      }  
      .col-sm-5 {
      	margin-top : 6px;
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
  </head>
  
  
  <body> 

 <%@include file="/WEB-INF/views/include/header.jsp" %>

    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3"><b>마이페이지</b></h4><br>
		  <div class="form-group row">
		    <label for="mem_id" class="col-sm-3 col-form-label">회원 가입일</label>
		    <div class="col-sm-5">
		      <span><fmt:formatDate value="${sessionScope.loginStatus.mem_date_sub }" pattern="yyyy-MM-dd hh:mm" />
		     </span>
		    </div>
		   <div class="form-group row">
		    <label for="mem_pw" class="col-sm-3 col-form-label">최근 로그인</label>
		    <div class="col-sm-5">
		      <span><fmt:formatDate value="${sessionScope.loginStatus.mem_date_last }" pattern="yyyy-MM-dd hh:mm" /></span>
		    </div>
		  </div>
		  <hr>
		   <div class="form-group row">
		    <label for="mem_pw" class="col-sm-3 col-form-label">진행중 주문</label>
		    <div class="col-sm-5">
		      <span>${orderProcessCount} 개</span>
		    </div>
		  </div>
		   <div class="form-group row">
		    <label for="mem_pw" class="col-sm-3 col-form-label">장바구니</label>
		    <div class="col-sm-5">
		      <span>${cartProductCount} 개</span>
		    </div>
		  </div>
		   <div class="form-group row">
		    <label for="mem_pw" class="col-sm-3 col-form-label">총 주문금액</label>
		    <div class="col-sm-5">
		      <span>${odr_totalPrice }원 (배송완료 기준)</span>
		    </div>
		  </div>
		   <div class="form-group row">
		    <label for="mem_pw" class="col-sm-3 col-form-label">사용가능 포인트</label>
		    <div class="col-sm-5">
		      <span>${sessionScope.loginStatus.mem_point }원</span>
		    </div>
  </div>
</div>
</div>
</div>
<p class="mb-1"></p><br><br><br><br>
</div>

    <!--  footer.jsp -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %> 

  <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
      
    <script>
    $(document).ready(function() {
        $("#btnSearchIDPW").on("click", function() {
          location.href = "/member/lostpass";
        });
      });
    
    </script>
  </body>
</html>