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
	
    <title>SwimLover_Login</title>

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
    <%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

  </head>


  <body> 

    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3"><b>로그인</b></h4><br>
          <form id = "loginForm" action = "loginPost" method = "post">
            <div class="mb-3">
            
              <div class="col-md-12 mb-3">
                <label for="mem_id">아이디</label>
                <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를  입력해주세요.">
              </div>
            
              <div class="col-md-12 mb-3">
                <label for="mem_pw">비밀번호</label>
                <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를 입력해주세요.">
              </div>
            
             <div class="col-md-12 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">로그인</button>
			  	<button type="button" class="btn btn-dark" id="btnSearchIDPW">ID/PW Search</button>
			  </div>
            
            </div>
          </form>
        </div> 
      </div>
      <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2021 YD</p><br><br><br><br>
      </footer>
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