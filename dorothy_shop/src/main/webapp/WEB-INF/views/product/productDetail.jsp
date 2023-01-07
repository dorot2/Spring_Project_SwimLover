<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<!-- 부트스트랩 적용 : https://themewagon.com/themes/free-bootstrap-5-html-5-ecommerce-website-template-zay-shop/ -->
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
        <title>Welcome to SwimLover</title>
      
        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
        
      <%@include file="/WEB-INF/views/include/common.jsp" %>
      
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  	<script id="reviewTemplate" type="text/x-handlebars-template">
  {{#each .}}
    <p>{{rv_content}}</p>
    <div class="row">
      <div class="col-md-3">{{idThreeDisplay mem_id}}</div>
      <div class="col-md-9">{{prettifyDate rv_date_reg}}</div>
    </div>
    <div class="row">
      <div class="col-md-3">
          {{displayStar rv_score}}
          <input type="hidden" name="rv_score" value="{{rv_score}}">
      </div>
      <div class="col-md-9">{{authorityview mem_id rv_num}}</div>
    </div>
    <hr>
  {{/each}}
  </script>

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
    p#star_rv_score a.rv_score {
      	font-size: 22px;
      	text-decoration: none;
      	color: lightgray;
      }
      
      p#star_rv_score a.rv_score.on {
      	color: black;
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

  	<div class="row mb-3">
	    <div class="col-md-6">
	      <img src="/product/displayFile?folderName=${productVO.pdt_img_folder }&fileName=${productVO.pdt_img}" alt="" width="450" height="450">
	    </div>
	    <div class="col-md-6">
	      <div class="card-body" style="text-align: center;">
	        <h5 class="card-title">${productVO.pdt_name }</h5>
          <input type="hidden" name="pdt_num" value="${productVO.pdt_num }">
          <input type="text" name="odr_amount" value="1">
	        <p class="card-text">test</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
        <div class="card-body" style="text-align: center;">
          <button type="button" name="btnDirectOrder"  class="btn btn-sm btn-outline-secondary">바로구매</button>
          <button type="button" name="btnCart" class="btn btn-sm btn-outline-secondary">장바구니</button>
        </div>
	    </div>
	  </div>

   <div class="row">
   	<div class="col-md-12">
   		<div id="tabs">
   			<ul>
   				<li><a href="#product_desc">상품설명</a></li>
   				<li><a href="#product_qna">상품후기</a></li>
   			</ul>
   			<div id="product_desc">
   				상품설명
   				${productVO.pdt_detail }
   			</div>
   			<div id="product_qna">
   				<h5>상품후기</h5>
   				<div class="form-group row">
   					<div class="col-md-12">
   						<p id="star_rv_score">
   							평점 :
   							<a class="rv_score" href="#">★</a>
   							<a class="rv_score" href="#">★</a>
   							<a class="rv_score" href="#">★</a>
   							<a class="rv_score" href="#">★</a>
   							<a class="rv_score" href="#">★</a>
   						</p>
   					</div>
   				</div>
   				<div class="form-group row">
   					<div class="col-md-12">
   						<textarea rows="3" cols="80" class="form-control" id="rv_content"></textarea>
   						<button type="button" id="btn_review_write" class="btn btn-link">등록</button>
               <button type="button" id="btn_review_edit" class="btn btn-link" style="display:none ;">수정</button>
   					</div>
   				</div>


          <!--상품후기 삽입위치-->
          <div class="row" id="reviewList">
            <div class="col-md-12" id="reviewItem">
      
            </div>
          </div>
          <!-- 상품후기 페이징 삽입위치 -->
          <div class="row" id="reviewPaging">
            <div class="col-md-12" id="reviewPaingItem">
              <nav aria-label="Page navigation example">
                <ul class="pagination"></ul>
              </nav>
            </div>
          </div>
   			</div>
   		</div>
   	</div>
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
        
        // 평점 별 클릭 시 동작
        $("p#star_rv_score a.rv_score").on("click", function(e){
        	e.preventDefault();
        	
        	$(this).parent().children().removeClass("on");
        	$(this).addClass("on").prevAll("a").addClass("on");
        });
        
      });
    </script>
  </body>
</html>
