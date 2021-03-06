<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
	<!-- Main Header -->
	<header class="main-header">
    
		<!-- Logo -->
		<a href="/admin/main" class="logo">
			<span class="logo-mini">
				<b>PB</b>
			</span>
			<span class="logo-lg">
				<b>Peach Blossom</b>
			</span>
		</a>

		<!-- Header Navbar -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
				
					<li>
						<a href="/admin/logout">LogOut</a>
					</li>

					<!-- Notifications Menu -->
					<li class="dropdown notifications-menu">
						<!-- Menu toggle button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell-o"></i>
							<span class="label label-warning"></span>
						</a>
					</li>
					
					<!-- Tasks Menu -->
					<li class="dropdown tasks-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-flag-o"></i>
							<span class="label label-danger"></span>
						</a>
						<ul class="dropdown-menu">
						</ul>
					</li>
					<!-- User Account Menu -->
					
					<li class="dropdown user user-menu">
						
						<!-- Menu Toggle Button -->
						<ul class="dropdown-menu">
						
							<!-- The user image in the menu -->
							<li class="user-header">
								<p>neveraxe - Web Developer <small>Member since April. 2021</small></p>
							</li>
							
							<!-- Menu Body -->
							<li class="user-body"></li>
							
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<button id="" class="btn btn-default btn-flat">정보변경</button>
								</div>
								<div class="pull-right">
									<a href="/admin/logout" class="btn btn-default btn-flat">로그아웃</a>
								</div>
							</li>
						</ul>
					</li>
				
				</ul>
			</div>	
		</nav>
	</header>