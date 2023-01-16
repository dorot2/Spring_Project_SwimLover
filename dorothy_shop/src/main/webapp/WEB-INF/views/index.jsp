<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="manifest" href="/docs/4.6/assets/img/favicons/manifest.json">
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

    
    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./resources/img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>SwimLover</b></h1>
                                <h3 class="h2">Let's SWIM!</h3>
                                <p>SwimLover에서 찾으세요, 당신의 수영부스터!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./resources/img/banner_img_02.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">신상 오리발</h1>
                                <h4 class="h4">중요한 것은 꺾이지 않는 튼튼한 오리발</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./resources/img/banner_img_03.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">단체수모 제작이벤트</h1>
                                <h3 class="h2"> ~ 2023년 3월 31일까지! </h3>
                                <p>
                               		설날맞이 특별 이벤트!
                               		단체 수모 파격할인 이벤트 (~80% 세일)
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">With SwimLover</h1>
                <p>
                    SwimLover에서는 다양한 브랜드의 수영물품들을 만나볼 수 있습니다.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="http://localhost:8000/product/productList/31/%EB%A1%B1%ED%95%80"><img src="./resources/img/category_img_01.png" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">오리발</h5>
                <p class="text-center"><a class="btn btn-success" href="http://localhost:8000/product/productList/31/%EB%A1%B1%ED%95%80">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="http://localhost:8000/product/productList/40/%ED%82%A5%ED%8C%90"><img src="./resources/img/category_img_02.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">훈련용품</h2>
                <p class="text-center"><a class="btn btn-success" href="http://localhost:8000/product/productList/40/%ED%82%A5%ED%8C%90">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="http://localhost:8000/product/productList/51/%ED%8E%B8%EC%9D%98%EC%9A%A9%ED%92%88"><img src="./resources/img/category_img_03.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">꿀템모음</h2>
                <p class="text-center"><a class="btn btn-success" href="http://localhost:8000/product/productList/51/%ED%8E%B8%EC%9D%98%EC%9A%A9%ED%92%88">Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">이달의 인기상품</h1>
                    <p>
                        2023년 1월 인기상품
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href=http://localhost:8000/product/productDetail?pdt_num=32>
                            <img src="./resources/img/feature_prod_01.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">40,000원</li>
                            </ul>
                            <a href="http://localhost:8000/product/productDetail?pdt_num=32" class="h2 text-decoration-none text-dark">나이키 실리콘 수모</a>
                            <p class="card-text">
                                                       스마일이 함께하는 나이키 실리콘 수모 화이트
                            </p>
                            <p class="text-muted">후기(508)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="http://localhost:8000/product/productDetail?pdt_num=36">
                            <img src="./resources/img/feature_prod_02.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">90,000원</li>
                            </ul>
                            <a href="http://localhost:8000/product/productDetail?pdt_num=36" class="h2 text-decoration-none text-dark">엘리트 미러 수경 화이트</a>
                            <p class="card-text">
                                                        무지개빛 미러코팅 처리가 멋진 패킹 수경
                            </p>
                            <p class="text-muted">후기(328)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="http://localhost:8000/product/productDetail?pdt_num=21">
                            <img src="./resources/img/feature_prod_03.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">88,000원</li>
                            </ul>
                            <a href="http://localhost:8000/product/productDetail?pdt_num=21" class="h2 text-decoration-none text-dark">엘리트 캔디 숏핀 레몬</a>
                            <p class="card-text">
                                                        숏핀 오리발
                            </p>
                            <p class="text-muted">후기(130)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->


    <!-- Start Footer -->
     <%@include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- End Footer -->

</body>

</html>
