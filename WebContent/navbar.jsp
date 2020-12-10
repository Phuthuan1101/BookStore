<%@page import="bean.KhachHangBean"%>
<%@page import="bean.AdminBean"%>
<%@page import="bean.GioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Đây là khu vực bỏ navbar -->
<%
                    GioHang gioHang =(GioHang) session.getAttribute("Gio");
                    int soluong = 0;
                    if(gioHang != null)
                    soluong = gioHang.getList().size();
                %>
<% AdminBean admin = (AdminBean) session.getAttribute("admin");
                        KhachHangBean khLogin=(KhachHangBean) session.getAttribute("user");
                        session.setAttribute("UserKh",khLogin );
                    %>


	<div class="grid wide">
		<div class="row">
			<div class="col l-12 header__navbar_first hide-on-moible hide-on-mobile-tablet">
				<nav class=" header__navbar__top ">
					<ul class=" nav-top__left  header__navbar-list">
						<li class="header__navbar-item"><i
							class="header-navbar-top__icon fas fa-envelope-square"></i>
							minhkhai@gmail.com</li>
						<li class="header__navbar-item"><i
							class="header-navbar-top__icon fas fa-phone-square-alt"></i> 0903
							10 14 79</li>
					</ul>
					<ul class="btn-top__right  header__navbar-list">
						<li class="header__navbar-item item-strong " data-toggle="modal"
							<%if (khLogin == null ){%> data-target="#LoginModalForm" <%} %>>
							<% 
			                                    if(khLogin != null   ){
			                                        out.print("Hi!:"+khLogin.getHoten()); 
			                                        System.out.println("get user tu session đang nhap thanh cong"); 	
			                                    }
			                                    if(admin !=null)
			                                        out.print("Hi!:Admin");
			                                    if(khLogin == null && admin ==null)
			                                    {
			                                        out.print("<i class='header-navbar-top__icon  fa fa-lock'></i> Login");
			                                        System.out.println("get admin tu session that bai");	
			                                    }
			                                    %>
		
						</li>
						<li class="item-separate "><span class="item-separate__span">|</span></li>
						<%if(khLogin == null && admin ==null){ %>
		
						<li class="header__navbar-item item-strong " data-toggle="modal"
							data-target="#modalRegisterForm"><i
							class="header-navbar-top__icon fas fa-user"></i> Đăng ký</li>
						<%} %>
						<%if(khLogin != null || admin !=null){%>
						<%System.out.println("hien thi dang xuat"); %>
						<li class="header__navbar-item item-strong item-strong_logout "><a
							class="btn_logout" href="DangXuat"><i
								class="header-navbar-top__icon fas fa-sign-out-alt"></i> Đăng Xuất</a>
						</li>
						<%} %>
					</ul>
				</nav>
			</div>
			<div class="col l-12 header__navbar_second">
				<nav class="header__navbar__bottom">
					<ul class="navbar-bottom__left">
						<li class="hide-on-moible icon_home hide-on-mobile-tablet"><a class="image_home__link" href="SachController">
							<i class="book_store fas fa-book"></i>BookStore</a>
						</li>
						<li class="navbar-bottom__left__bill hide-on-mobile-tablet"><a href="ThanhToanController"
							class="navbar-bill__link">Thanh Toán</a></li>
						<li class="navbar-bottom__left__bill hide-on-mobile-tablet"><a href="LichsuamuahangController"
							class="navbar-bill__link">Lịch Sử Mua Hàng</a></li>
						<li class="nav_search">
							<form class="form_search" action="SachController">
								<input type="text" class="form_search_btn form-control w-3"
									placeholder="Search" name="search">
								<button class="form_search_btn btn btn-default btn-search"
									type="submit">
									<i class="icon_search glyphicon glyphicon-search"></i>
								</button>
							</form>
						</li>
					</ul>
					<ul class="navbar-bottom__right">
						<li>
							<div class="header-button__cart  ">
								<a href="giohang.jsp" class="icon-link__cart">Giỏ Hàng<i
									class="icon_cart  fas fa-cart-plus"></i><span
									class="icon_cart_sl"> <% if(soluong != 0) {%> <%=soluong %>
										<%}else %> 0
								</span></a>
		
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
</div>


<%if((boolean)session.getAttribute("ShowLoginForm") == true){ %> 
	<script type="text/javascript">
	        $(window).on('load',function(){
	            $('#LoginModalForm').modal('show');
	        });
	</script>
	
 <%
session.removeAttribute("ShowLoginForm"); 
 
} %>
<%if((boolean)session.getAttribute("ShowSignUPForm") == true && khLogin == null ){ %> 
	<script type="text/javascript">
	        $(window).on('load',function(){
	            $('#modalRegisterForm').modal('show');
	        });
	</script>
	
 <%
session.removeAttribute("ShowSignUpForm"); 
} %>