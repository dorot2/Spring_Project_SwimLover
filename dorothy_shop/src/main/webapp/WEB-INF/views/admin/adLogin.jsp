<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <%@include file="/WEB-INF/views/include/common.jsp" %>
	
    <title>Admin_SwimLover</title>

	  <style>
      body {
        min-height: 100vh;
        background: #000000;
      }
      .input-form {
        max-width: 400px;
        margin-top: 200px;
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
    </style>

    <script>
      let msg = '${msg}';
      if(msg != '') {
        alert(msg);
      }
    </script>
  </head>

  <body>
    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3"><b>SwimLover 관리자 로그인</b></h4><br>
          <form action = "/admin/admin_ok" method = "post">
            <div class="mb-3">
              <div class="col-md-12 mb-3">
                <label for="admin_id">아이디</label>
                <input type="text" class="form-control" id="admin_id" name="admin_id" placeholder="아이디를 입력해주세요.">
              </div>
            
              <div class="col-md-12 mb-3">
                <label for="admin_pw">비밀번호</label>
                <input type="password" class="form-control" id="admin_pw" name="admin_pw" placeholder="비밀번호를 입력해주세요.">
              </div>
              
              <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-dark" id="btnLogin">로그인</button>
              </div>
            </div>
          </form>
        </div> 
      </div>
      <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2021 YD</p><br><br><br><br>
      </footer>
    </div>
  </body>
</html>