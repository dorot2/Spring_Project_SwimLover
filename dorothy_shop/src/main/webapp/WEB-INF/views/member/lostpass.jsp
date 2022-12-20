<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
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
	
    <title>SwimLover_lostpass</title>

	  <style>
	
      body {
        min-height: 80vh;
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
      <div class="input-form-backgroud row">
      
        <div class="input-form col-md-12 mx-auto">
          <h3 class="mb-3"><b>아이디 찾기</b></h3>
	 	<form id="searchForm" action="searchID" method="post">
            <div class="row">
            
            
              <div class="col-md-3 mb-3">
                <label for="mem_name">성함</label>
		      <input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="NAME">
		    </div>
            
              <div class="col-md-5 mb-3">
		    <label for="mem_email">이메일</label>
		      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="EMAIL">
		    </div>
		    
              		
             <div class="col-md-4 mb-3">
             	<label>&nbsp;</label>
			  	<button type="submit" class="btn btn-dark" id="btnLogin">아이디 찾기</button>
			  	<button type="button" class="btn btn-dark" id="btnSearchIDPW">로그인</button>
			  </div>
			  
			  
			  </div>
			</form>
			  </div>
			  
			  
			   <!-- 임시비밀번호 발급 -->
			      <div class="container">
      <div class="input-form-backgroud row">
      
        <div class="input-form col-md-12 mx-auto">
         <h3 class="mb-3"><b>임시비밀번호 발급</b></h3>
         
         
	 <div class="col-sm-6">
	 	<form id="loginForm" action="searchPw" method="post">
		  <div class="form-group row">
		    <label for="mem_id" class="col-sm-4 col-form-label">아이디</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID" required>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_pw" class="col-sm-4 col-form-label">전자우편</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="EMAIL" required>
		    </div>
		  </div>
		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">임시 비밀번호 발급</button>
			  	<!-- <button type="button" class="btn btn-dark" id="btnSearchIDPW">로그인</button> -->
			  </div>			
		  </div>
		  <!-- 임시비번 발급완료 -->			

              </form>
              </div>
              </div>
              </div>
            </div>
      
      
      
      <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2021 YD</p><br><br><br><br>
      </footer>
    </div> 
 
 
	 
	 
	
	 	</form>
	 </div>


    <!--  footer.jsp -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %> 

  </body>
</html>