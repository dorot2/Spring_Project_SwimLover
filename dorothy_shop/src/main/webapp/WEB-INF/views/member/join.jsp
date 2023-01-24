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
    
	  <!-- common.jsp -->
    <%@include file="/WEB-INF/views/include/common.jsp" %>
	
    <title>SwimLover</title>

	  <style>
	
      body {
        min-height: 150vh;
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

    <%@include file="/WEB-INF/views/include/header.jsp" %>
    <%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3"><b>회원가입</b></h4><br>
          <form id = "joinForm" action = "join" method = "post" class="validation-form" novalidate>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="mem_id">아이디</label>
                <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를  8~15이내로 입력" required>
                <div class="invalid-feedback">아이디를 입력해주세요.</div>
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
                <label for="mem_pw">비밀번호</label>
                <input type="password" class="form-control" id="mem_pw" name="mem_pw" required>
                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
              </div>            
              <div class="col-md-6 mb-3">
                <label for="mem_pw_2">비밀번호 확인</label>
                <input type="password" class="form-control" id="mem_pw_2" name="mem_pw_2" required>
                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
              </div>            
              <div class="col-md-4 mb-3">
                <label for="mem_name">이름</label>
                <input type="text" class="form-control"  id="mem_name" name="mem_name" required>
                <div class="invalid-feedback">이름을 입력해주세요.</div>
              </div>            
              <div class="col-md-4 mb-3">
                <label for="mem_nick">닉네임</label>
                <input type="text" class="form-control" id="mem_nick" name="mem_nick" required>
                <div class="invalid-feedback">닉네임을 입력해주세요.</div>
              </div>          
              <div class="col-md-4 mb-3">
                <label for="mem_phone">휴대폰 번호</label>
                <input type="text" class="form-control" id="mem_phone" name="mem_phone" placeholder="010-1234-1234" required>
                <div class="invalid-feedback">휴대폰 번호를 입력해주세요.</div>
              </div>              
              <div class="col-md-6 mb-3">
                <label for="mem_email">이메일</label>
                <input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="swimlover@example.com" required>
                <div class="invalid-feedback">이메일을 입력해주세요.</div>
              </div>
              <div class="col-md-2 mb-3">
              	<label>&nbsp;</label>
                <button type="button" class="btn btn-dark btn-block" id="btnAuthcode">인증요청</button>   
              </div>
              <div class="col-md-6 mb-3">
                <label for="mem_authcode">메일인증코드</label>
                <input type="text" class="form-control" id="mem_authcode" name="mem_authcode" required>
              </div>
              <div class="col-md-2 mb-3">
                <label>&nbsp;</label>
                <button type = "button" class="btn btn-dark btn-block" id="btnConfirmAuthcode">인증확인</button>
              </div>
              <div class="col-md-6 mb-3">
                <label for="sample2_postcode">우편번호</label>
                <input type="text" class="form-control" id="sample2_postcode" name="mem_zipcode" required>
              </div>
              <div class="col-md-3 mb-3">
                <label>&nbsp;</label>
                <input type="button" class="btn btn-dark btn-block" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
              </div>
              <div class="col-md-12 mb-3">
                <label for="sample2_address">주소</label>
                <input type="text" class="form-control" id="sample2_address" name="mem_addr" placeholder="주소를 입력해주세요." required>
              </div>
              <div class="col-md-12 mb-3">
                <label for="sample2_detailAddress">상세주소</label>
                <input type="text" class="form-control" id="sample2_detailAddress" name="mem_addr_d" placeholder="상세주소를 입력해주세요." required>
                <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
              </div>
            </div>

            <hr class="mb-4">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="mem_accept_info" name="mem_accept_info">
              <label class="custom-control-label" for="mem_accept_info">개인정보 수집 및 이용에 동의합니다.</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="mem_accept_e" name="mem_accept_e">
              <label class="custom-control-label" for="mem_accept_e">메일 수신에 동의합니다.</label></br>
            </div>
            <div class="mb-4"></div>
            <button class="btn btn-primary btn-lg btn-block" id="btnJoin" type="submit">회원가입</button>            
          </form>
        </div> 
      </div>
      <footer class="my-3 text-center text-small">
        <p class="mb-1"></p><br><br><br><br>
      </footer>
    </div>

    <%@include file="/WEB-INF/views/include/footer.jsp" %> 

    <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>
      
    <script>
      $(document).ready(function(){
        let joinForm = $("#joinForm");
        //아이디 중복체크 사용
        let isCheckID = false;
        // 메일인증 사용
        let isMailAuth = false;
      
        // ID중복체크
        $("#btnIDCheck").on("click", function() {
          if($("#mem_id").val() == "") {
            alert("아이디를 입력하세요.");
            $("#mem_id").focus();
            return;
          }
      
          $.ajax({
            url: '/member/idCheck',
            type: 'get',
            dataType: 'text',
            data: { mem_id : $("#mem_id").val() },
            success: function(data) {
              console.log("아이디 사용유무: " + data);
      
              $("#idCheckStatus").css({'display':'inline', 'color':'red'});
      
              if(data == "yes") {
                $("#idCheckStatus").html("<b>" + $("#mem_id").val() + " 가능</b>");
                isCheckID = true;
              }else{
                $("#idCheckStatus").html("<b>" + $("#mem_id").val() + " 불가능</b>");
                $("#mem_id").val("");
                $("#mem_id").focus();
              }
            }
          });
        });      
          
        // 메일인증코드 요청
        $("#btnAuthcode").on("click", function(){
          if($("#mem_email").val() == "") {
            alert("메일주소를 입력하세요.");
            $("#mem_email").focus();
            return;
          }
          
          $.ajax({
            url : '/email/send',
            type : 'get',
            dataType : 'text',
            data : {receiverMail: $("#mem_email").val()},
            success:function(data) {
              if(data == "success"){
                alert("인증메일이 발송되었습니다. 인증코드를 확인해주세요.");
              } else {
                alert("메일 발송이 실패되었습니다. 관리자에게 문의해주세요.");
              }
            }
          });
        });
          
        // 메일인증확인
        $("#btnConfirmAuthcode").on("click", function(){
          let authCode = $("#mem_authcode").val();
          
          $.ajax({
            url : '/email/confirmAuthCode',
            type : 'post',
            dataType : 'text',
            data : {authCode : authCode},
            success : function(data) {
              if(data == "success") {
                alert("인증이 일치합니다.");
                isMailAuth = true;
              }else if(data == "fail") {
                alert("인증이 불일치 합니다. \n메일인증요청을 다시 해주세요.");
              }
            }
          });
        });
        
        //회원가입 전송 클릭
        $("#btnJoin").on("click", function() {
        alert("회원가입이 완료되었습니다 :) 로그인 해주세요!");
        });
      });
    </script>
      
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
      function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
      }

      function sample2_execDaumPostcode() {
        new daum.Postcode({
          oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample2_extraAddress").value = extraAddr;
            
            } else {
              document.getElementById("sample2_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample2_postcode').value = data.zonecode;
            document.getElementById("sample2_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample2_detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_layer.style.display = 'none';
          },

          width : '100%',
          height : '100%',
          maxSuggestItems : 5

        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
      }

      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
    
      // submit 클릭 시 필수입력사항 확인하기
      window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }

            form.classList.add('was-validated');
          }, false);
        });
      }, false);
        
    </script>
  </body>
</html>