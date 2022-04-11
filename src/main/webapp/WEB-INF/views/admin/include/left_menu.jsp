<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
	.main-sidebar {
		font-size: 13px;
	}
</style>

<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel" style="padding-bottom: 30px;">
        <div class="pull-left info" style="margin-left:-50px;">
          <p>상점관리 <small> shop admin</small></p>
          <!-- Status -->
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"><fmt:formatDate value="${sessionScope.adLoginStatus.admin_date_late }" pattern="yyyy-MM-dd HH:mm:ss" /></li>
        <!-- Optionally, you can add icons to the links -->
        <li class="treeview">
          <a href="#">
          	<i class="fa fa-link"></i>
          	<span>관리자기능</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/adminRegister">관리자회원추가</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
          	<i class="fa fa-link"></i>
          	<span>상품등록 관리</span>
            <span class="pull-right-container">
            	<i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/product/productInsert">상품등록</a></li>
            <li><a href="/admin/product/productList">상품리스트</a></li>
            <li><a href="/admin/slide/slideInsert">슬라이드등록</a></li>
            <li><a href="/admin/slide/slideList">슬라이드리스트</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
          	<i class="fa fa-link"></i>
          	<span>주문관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/order/orderList">주문리스트</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
          	<i class="fa fa-link"></i>
          	<span>회원관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/member/userinfo_list">회원목록</a></li>
            <li><a href="#">Link in level 2</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
          <i class="fa fa-link"></i>
          <span>통계관리</span>
            <span class="pull-right-container">
            	<i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/chart/overall">주문통계</a></li>
          </ul>
        </li>
        
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>