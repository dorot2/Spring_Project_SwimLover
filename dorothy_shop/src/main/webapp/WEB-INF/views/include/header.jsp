<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="">
        <div class="container text-light flex-column flex-md-row">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <a class="navbar-sm-brand text-light text-decoration-none">${sessionScope.loginStatus.mem_nick}</a>
                </div>
                <div>
                <!-- 로그인 이전 상태표시 -->
			    <c:if test="${sessionScope.loginStatus == null }">
			    <a class="p-2 text-light" href="/member/login">LOGIN</a>
			    <a class="p-2 text-light" href="/member/join">JOIN</a>
			    </c:if>
    
    			<!-- 로그인 이후 상태표시 -->
                <c:if test="${sessionScope.loginStatus != null }">
			    <a class="p-2 text-light" href="/member/logout">LOGOUT</a>
			    <a class="p-2 text-light" href="/member/confirmPW">MODIFY</a>
			    </c:if>
			    <a class="p-2 text-light" href="/order/orderList">ORDER</a>
	               </div>
            </div>
        </div>
    </nav>