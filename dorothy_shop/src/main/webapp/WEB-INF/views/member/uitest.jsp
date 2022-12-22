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
    
    <title>test_양지원</title>

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
  </head>

  <body> 

    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3"><b>회원가입</b></h4><br>
          <form id = "joinForm" action = "join" method = "post">
            <div class="row">
            
              <div class="col-md-6 mb-3">
                <label for="id">아이디</label>
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디를  8~15이내로 입력" required>
              </div>
            
              <div class="col-md-3 mb-3">
                <label>&nbsp;</label>
                <button type="button" class="btn btn-link" id="btnIDCheck">ID중복확인</button>
              </div>
            
              <div class="col-md-3 mb-3">
                <label>&nbsp;</label>
                <label style="display:none;" id="idCheckStatus">중복확인결과</label>
              </div>
            
              <div class="col-md-6 mb-3">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>
            
              <div class="col-md-6 mb-3">
                <label for="password_check">비밀번호 확인</label>
                <input type="password" class="form-control" id="password_check" name="password_check" required>
              </div>
            
              <div class="col-md-4 mb-3">
                <label for="name">이름</label>
                <input type="text" class="form-control"  id="name" name="name" required>
              </div><br>
              
              <div class="col-md-4 mb-3">
                <label for="mail">이메일</label>
                <input type="email" class="form-control" id="mail" name="mail" placeholder="dorothy@example.com" required>
              </div>
              
              <div class="col-md-4 mb-3">
                <label>이메일 수신여부</label><br>
                    <label for="Y">수신</label>
                <input type="radio" name="emailaccept" value="Y" id="Y">
                <label for="N">수신안함</label>
                <input type="radio" name="emailaccept" value="N" id="N">
              </div>
            
              <div class="col-md-12 mb-3">
                <label for = "pwq">비밀번호 확인시 질문</label><br>
                <select name="pwq">
                  <option value="">========선택========</option>
                  <option value="내가 가장 좋아하는 색은?">내가 가장 좋아하는 색은?</option>
                  <option value="내 보물 1호는?">내 보물 1호는?</option>
                  <option value="내가 가장 좋아하는 사람은?">내가 가장 좋아하는 사람은?</option>
                </select>
              </div>
	      
	      
              <div class="col-md-12 mb-3">
                <label for="pwa">비밀번호 확인시 답변</label>
                <input type="text" class="form-control" id = "pwa">
              </div>
      

              <div class="col-md-12 mb-3">
                <label>성별</label><br>
                  <label for="man">남자</label>
                  <input type="radio" name="gender" value="m" id="man">
                  <label for="woman">여자</label>
                  <input type="radio" name="gender" value="m" id="woman">
              </div>
       
              <div class="col-md-12 mb-3">
                <label>생년월일</label><br>
                  <select name="year">
                    <option value="">1900</option>
                    <option value="1994">1994</option>
                    <option value="1995">1995</option>
                    <option value="1996">1996</option>
                    <option value="1997">1997</option>
                    <option value="1998">1998</option>
                    <option value="1999">1999</option>
                    <option value="2000">2000</option>
                  </select>
                  
                  <select name="month">
                    <option value="">01</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>
                  
                  <select name="day">
                    <option value="">11</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                  </select>
              </div>

            <div class="mb-4"></div>
              <button class="btn btn-primary btn-lg btn-block" id="btnJoin" type="submit">회원가입</button>            
          </div>
          </form>
        </div> 
      </div>
    </div>


       <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>
    
    <script>

    $(document).ready(function(){
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        var getCheck= RegExp(/^[a-zA-Z0-9]{4,16}$/);
        var getCheckP = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/);
        var getName= RegExp(/^[가-힣]+$/);

      //회원가입 전송 클릭
      $("#btnJoin").on("click", function() {

        //아이디 공백 확인
        if($("#id").val() == ""){
          alert("아이디를 입력해주세요");
          $("#id").focus();
          return false;
        }
            
        //아이디 유효성검사
        if(!getCheck.test($("#id").val())){
          alert("형식에 맞게 입력해주세요");
          $("#id").val("");
          $("#id").focus();
          return false;
        }

        //비밀번호 공백 확인
        if($("#password").val() == ""){
          alert("패스워드를 입력해주세요");
          $("#password").focus();
          return false;
        }
            
        //비밀번호 유효성검사
        if(!getCheckP.test($("#password").val())){
          alert("형식에 맞게 입력해주세요");
          $("#password").val("");
          $("#password").focus();
          return false;
        }
            
        //비밀번호 확인란 공백 확인
        if($("#password_check").val() == ""){
          alert("패스워드 확인을 해주세요");
          $("#password_check").focus();
          return false;
        }

        //이름 공백 검사
          if($("#name").val() == ""){
          alert("이름을 입력해주세요");
          $("#name").focus();
          return false;
        }

        //이름 유효성 검사
        if(!getCheck.test($("#name").val())){
          alert("이름형식에 맞게 입력해주세요")
          $("#name").val("");
          $("#name").focus();
          return false;
        }
            
        //이메일 공백 확인
        if($("#mail").val() == ""){
          alert("이메일을 입력해주세요");
          $("#mail").focus();
          return false;
        }
            
        //이메일 유효성 검사
        if(!getMail.test($("#mail").val())){
          alert("이메일형식에 맞게 입력해주세요")
          $("#mail").val("");
          $("#mail").focus();
          return false;
        }
            
        // 비밀번호 확인질문        
        if(!pwq){
          alert("비밀번호 확인질문를 선택해 주세요");
          return false;
        }

        // 비밀번호 확인답변 공백 확인
        if($("#pwa").val() == ""){
          alert("비밀번호 확인질문에 대한 답변을 입력해주세요");
          $("#pwa").focus();
          return false;
        }

        joinForm.submit();
    
      });

    });
  
    </script>
    
  </body>
</html>