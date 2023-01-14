<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin_SwimLover</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
    
    <script>
      let msg = '${msg}';

      if(msg != '') {
        alert(msg);
      }
    </script>

  </head>

  <body class="hold-transition skin-black sidebar-mini">
    <div class="wrapper">
      <!-- Main Header -->
      <%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
      <!-- Left side column. contains the logo and sidebar -->
      <%@ include file="/WEB-INF/views/admin/include/nav.jsp" %>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
     
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>관리자 페이지
            <small>SwimLover 관리자 페이지</small>
          </h1>
        </section>
      
        <!-- Main content -->
        <section class="content container-fluid">

          <!--------------------------
          | Your Page Content Here |
          -------------------------->
          
          <div class="row">
            <div class="col-md-2">진행상태</div>
            <div class="col-md-8">
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="전체">전체</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="주문접수">주문접수(${orderStatus1})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="결제완료">결제완료(${orderStatus2})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="배송준비중">배송준비중(${orderStatus3})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="배송처리">배송처리(${orderStatus4})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="배송완료">배송완료(${orderStatus5})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="주문취소">주문취소(${orderStatus6})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="미주문">미주문(${orderStatus7})</button>
            </div>
          </div>          
            
          <div class="row">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8">
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="취소요청">취소요청(${orderStatus8})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="취소완료">취소완료(${orderStatus9})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="교환요청">교환요청(${orderStatus10})</button>
              <button type="button" class="btn btn-link" style="width: 100px;" name="btnOderStatus" data-odr_status="교환완료">교환완료(${orderStatus11})</button>
            </div>
          </div>

          <form id="searchForm" action="" method="get">
            <div class="row">
              <div class="col-md-2">기간</div>
              <div class="col-md-8">
                <input type="date" name="startDate"> ~ <input type="date" name="endDate">  
              </div>
            </div>

            <div class="row">
              <div class="col-md-2">검색</div>
              <div class="col-md-6">
                <!-- 1)검색폼 -->
                <select name="type">
                  <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }" />>--</option>
                  <option value="O" <c:out value="${pageMaker.cri.type eq 'O' ? 'selected' : '' }" />>주문번호</option>
                  <option value="M" <c:out value="${pageMaker.cri.type eq 'M' ? 'selected' : '' }" />>주문자ID</option>
                  <option value="OM" <c:out value="${pageMaker.cri.type eq 'OM' ? 'selected' : '' }" />>주문번호 or 주문자ID</option>
                </select>

                <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                <button type="button" id="btnSearch" class="btn btn-link">Search</button>
              </div>
            </div>
          </form>

          <div class="row">
            <div class="col-md-12">
              <div class="box box-primary">
                <div class="box-header">
                  LIST ORDER
                </div>
                <div class="box-body">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col"><input type="checkbox" id="checkAll" name="checkAll"></th>
                        <th scope="col">주문번호</th>
                        <th scope="col">주문일시</th>
                        <th scope="col">주문자/수령인</th>
                        <th scope="col">주문금액/배송비</th>
                        <th scope="col">결제상태</th>
                        <th scope="col">주문상태</th>
                        <th scope="col">기능</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${orderList }" var="orderVO">
                        <!-- BoardVO클래스의 필드명으로 코딩했지만, 호출은 getter메서드가 사용됨. -->
                        <tr>
                          <td><input type="checkbox" class="check"></td>
                          <td><span class="odr_code">${orderVO.odr_code}</span></td>
                          <td><fmt:formatDate value="${orderVO.odr_date}" pattern="yyyy-MM-dd hh:mm"/></td>
                          <td>${orderVO.mem_id} / ${orderVO.odr_name}</td>
                          <td>${orderVO.odr_total_price}</td>
                          <td>결제상태</td>
                          <td>
                            <select name="odr_status">
                              <option value="전체" ${orderVO.odr_status eq '전체' ? 'selected':''}>전체</option>
                              <option value="주문접수" ${orderVO.odr_status eq '주문접수' ? 'selected':''}>주문접수</option>
                              <option value="결제완료" ${orderVO.odr_status eq '결제완료' ? 'selected':''}>결제완료</option>
                              <option value="배송준비중" ${orderVO.odr_status eq '배송준비중' ? 'selected':''}>배송준비중</option>
                              <option value="배송처리" ${orderVO.odr_status eq '배송처리' ? 'selected':''}>배송처리</option>
                              <option value="배송완료" ${orderVO.odr_status eq '배송완료' ? 'selected':''}>배송완료</option>
                              <option value="주문취소" ${orderVO.odr_status eq '주문취소' ? 'selected':''}>주문취소</option>
                              <option value="미주문" ${orderVO.odr_status eq '미주문' ? 'selected':''}>미주문</option>
                              <option value="취소요청" ${orderVO.odr_status eq '취소요청' ? 'selected':''}>취소요청</option>
                              <option value="취소완료" ${orderVO.odr_status eq '취소완료' ? 'selected':''}>취소완료</option>
                              <option value="교환요청" ${orderVO.odr_status eq '교환요청' ? 'selected':''}>교환요청</option>
                              <option value="교환완료" ${orderVO.odr_status eq '교환완료' ? 'selected':''}>교환완료</option>
                            </select>
                          </td>
                          <td>
                            <button type="button" name="btnOrderStatusChange" class="btn btn-link">적용</button>
                            <button type="button" name="btnOrderDetail1" class="btn btn-link">상세보기1</button>
                            <button type="button" name="btnOrderDetail2" class="btn btn-link">상세보기2</button>
                            <button type="button" name="btnOrderDelete" class="btn btn-link">삭제</button>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                  <nav aria-label="...">
                    <ul class="pagination">
                      <!-- 이전표시 -->
                      <c:if test="${pageMaker.prev }">
                        <li class="page-item">
                          <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
                        </li>
                      </c:if>
              
                      <!-- 페이지번호 표시.  1  2  3  4  5 -->
                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
                        <li class='page-item ${pageMaker.cri.pageNum == num ? "active": "" }'><a class="page-link" href="${num}">${num}</a></li>
                      </c:forEach>

                      <!-- 다음표시 -->
                      <c:if test="${pageMaker.next }">
                        <li class="page-item">
                          <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
                        </li>
                      </c:if>
                    </ul>
                    <!--1)페이지 번호 클릭시-->
                    <form id="actionForm" action="" method="get">
                      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                      <input type="hidden" name="type" value="${pageMaker.cri.type}">
                      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                    </form>
                  </nav>
                </div>
              </div>
            </div>
          </div>
            
          <div class="row">
            <div class="col-md-12">
              <button type="button" class="btn btn-link" id="btnCheckedOrderStateChange">선택주문상태변경</button>
            </div>
          </div>

        </section>
      </div>

      <!-- Main Footer -->
      <%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane active" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript:;">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
            </ul>
            <!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript:;">
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="pull-right-container">
                      <span class="label label-danger pull-right">70%</span>
                    </span>
                  </h4>

                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>
                </a>
              </li>
            </ul>
            <!-- /.control-sidebar-menu -->
          </div>
          <!-- /.tab-pane -->
          
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
          <!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked>
                </label>

                <p>
                  Some information about this general settings option
                </p>
              </div>
              <!-- /.form-group -->
            </form>
          </div>
          <!-- /.tab-pane -->
        </div>
      </aside>
      <!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
      immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->
    <%@ include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

  </body>
</html>