<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>SwimLover</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    <%@include file="/WEB-INF/views/include/common.jsp" %>
  
    <meta name="theme-color" content="#563d7c">

    <style>
      body {
        min-height: 170vh;
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
  </head>

  <body>
    
    <%@include file="/WEB-INF/views/include/header.jsp" %>
    <%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

    <div class="container">
      <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
          <h4 class="mb-3"><b>정보수정</b></h4><br>
          <form id="modifyForm" action="modify" method="post">
            <div class="form-group row">
              <label for="mem_id" class="col-sm-2 col-form-label">아이디</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" id="mem_id" name="mem_id" value="${memberVO.mem_id}" readonly>
              </div>		    
            </div>
            <div class="form-group row">
              <label for="mem_pw" class="col-sm-2 col-form-label">비밀번호</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="mem_pw" name="mem_pw">
              </div>
            </div>
            <div class="form-group row">
              <label for="mem_name" class="col-sm-2 col-form-label">이름</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mem_name" name="mem_name" value="${memberVO.mem_name}">
              </div>
            </div>
            <div class="form-group row">
              <label for="mem_nick" class="col-sm-2 col-form-label">닉네임</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mem_nick" name="mem_nick" value="${memberVO.mem_nick}">
              </div>
            </div>
            <div class="form-group row">
              <label for="mem_email" class="col-sm-2 col-form-label">전자우편</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mem_email" name="mem_email" value="${memberVO.mem_email}">
              </div>
            </div>
            <div class="form-group row">
              <label for="mem_phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="mem_phone" name="mem_phone" value="${memberVO.mem_phone}">
              </div>
            </div>
            <div class="form-group row">
              <label for="sample2_postcode" class="col-sm-2 col-form-label">우편번호</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="sample2_postcode" name="mem_zipcode" value="${memberVO.mem_zipcode}">
                <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
              </div>
            </div>
            <div class="form-group row">
              <label for="sample2_address" class="col-sm-2 col-form-label">주소</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="sample2_address" name="mem_addr" value="${memberVO.mem_addr}">
              </div>
            </div>
            <div class="form-group row">
              <label for="sample2_detailAddress" class="col-sm-2 col-form-label">상세주소</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="sample2_detailAddress" name="mem_addr_d" value="${memberVO.mem_addr_d}">
                <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
              </div>
            </div>
		        <div class="form-group row">
			        <div class="col-sm-12 text-center">
			  	      <button type="button" class="btn btn-dark" id="btnModify">수정하기</button>
			        </div>			
		        </div>
	        </form>
        </div>
      </div>
      <p class="mb-1"></p><br><br><br><br>
    </div>
  
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
  
    <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>

    <script>
      $(document).ready(function(){
        let modifyForm = $("#modifyForm");
        //회원수정 전송 클릭
        $("#btnModify").on("click", function() {
          modifyForm.submit(); // 폼의 정보가 서버로 진행된다.
        });
      });
    </script>

    <!-- 우편번호 -->
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
      
    </script>  
  </body>
</html>
