<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<!-- 부트스트랩 적용 : https://themewagon.com/themes/free-bootstrap-5-html-5-ecommerce-website-template-zay-shop/ -->
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">	
      <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.101.0">
        <title>Welcome to SwimLover</title>
      
        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
        
      <%@include file="/WEB-INF/views/include/common.jsp" %>

        <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="/manifest" href="/docs/4.6/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/4.6/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
    <link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
    <meta name="msapplication-config" content="/docs/4.6/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">


    <style>
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
      .navbar {
          font-size : 25px;
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
      <h1 class="display-4">${cate_name }</h1>
    </div>

    <div class="container">
      <div class="row">
        <c:forEach items="${productList }" var="productVO">
          <div class="col-md-3">
            <div class="card mb-4 shadow-sm">
              <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
              <a href="${productVO.pdt_num }" class="proDetail">
              <img src="/product/displayFile?folderName=${productVO.pdt_img_folder }&fileName=s_${productVO.pdt_img}" class="bd-placeholder-img card-img-top" width="100%" height="225">
              </a>
                
              <div class="card-body">
                <p class="card-text">${productVO.pdt_name }</p>
                <p class="card-text">
                  <fmt:formatNumber type="currency" pattern="￦#,###" value="${productVO.pdt_price }" /> 원
                </p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <input type="hidden" value="${productVO.pdt_num }" name="pdt_num"> 
                    <button type="button" name="btnDirectOrder"  class="btn btn-sm btn-outline-secondary">바로구매</button>
                    <button type="button" name="btnCart" class="btn btn-sm btn-outline-secondary">장바구니</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

	<%@include file="/WEB-INF/views/include/footer.jsp" %>
    <script>
      $(document).ready(function(){

        // 장바구니 클릭
        $("button[name='btnCart']").on("click", function(){

          $.ajax({
            url : '/cart/cart_add',
            data : {pdt_num : $(this).parent().find("input[name='pdt_num']").val(), cart_amount : 1},
            success : function(result) {
              if(result == "success") {
                alert("장바구니에 추가됨.");
                if(confirm("장바구니로 이동하시겠습니까?")) {
                  location.href = "/cart/cart_list";
                }
              }
            }
            
          });
        });
        
        // 바로구매 클릭
        $("button[name='btnDirectOrder']").on("click", function(){
        	
        	// 주문작성 페이지
        	// 상품코드, 수량 : 기본값 1
        	let pdt_num = $("input[name='pdt_num']").val();
        	let odr_amount = 1;
        	
        	let url = "/order/orderListInfo?pdt_num=" + pdt_num + "&odr_amount=" + odr_amount + "&type=direct";
        	
        	console.log("주문작성 URL : " + url);
        	location.href = url;
        	
        });
      });
    </script>
  </body>
</html>
