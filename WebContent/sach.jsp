<%@page import="bean.MonHang"%>
<%@page import="bean.GioHang"%>
<%@page import="bean.AdminBean"%>
<%@page import="bean.KhachHangBean"%>
<%@page import="dao.XuLyDao"%>
<%@page import="bean.LoaiSach"%>
<%@page import="bo.LoaiBO"%>
<%@page import="dao.LoaiDAO"%>
<%@page import="bean.Sach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.SachBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà Sách Minh Khai</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reponsive.css">


<!-- Phân trang -->




<!-- end phân trang -->

</head>
<body style="background-color: rgb(233, 237, 240)">
	<%
        ArrayList<Sach> ds;
        ds = (ArrayList<Sach>)request.getAttribute("listsach");
        /* int n = ds.size() ; */
        ArrayList<LoaiSach> listLoai = (ArrayList<LoaiSach>)request.getAttribute("listloaisach");
        int m = listLoai.size();
        %>
	<label for="nav-input-mobile-tablet" class="menu-mobile-tablet"><i
		style="font-size: 35px;" class="fas fa-bars"></i></label>
	<input type="checkbox" hidden name="" class="nav-input-check"
		id="nav-input-mobile-tablet">
	<label for="nav-input-mobile-tablet" class="overlay-mobile-tablet"></label>
	<nav class="header-menu_mobile-tablet">
		<form class="list-menu-table-mobile" action="SachController">
			<ul class="list-group-block">
				<li class="list-group-item">Nhóm Sản Phẩm</li>
				<li class="list-group-item">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</li>

				<%for(int i=0; i<m; i++){ %>
				<li class="list-mobile" name="tag" value="<%=listLoai.get(i).getMaLoai()%>"><a class="list-monile-item"
					href="SachController?tag=<%=listLoai.get(i).getMaLoai()%>"> <%=listLoai.get(i).getTenLoai()%>
				</a></li>
				<%} %>
			</ul>
		</form>
	</nav>

<div class="container-fluid">

	<!-- SECTION NAVBAR -->

	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- END SECTION NAVBAR -->

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



	
		<div  class="grid wide product">
			<div class="row">
				<div class=" col l-3 m-3 left-panel-content">
					<form action="SachController">
						<ul class="list-group">
							<li class="list-group-item herder-tab"><i
								class="icon_list fa fa-list" aria-hidden="true"></i> Danh Mục Sản
								Phẩm</li>
							<li class="list-group-item hide-on-mobile-tablet">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search"
										name="search">
									<div class="input-group-btn">
										<button class="btn btn-default btn_search_2" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</li>
	
							<%for(int i=0; i<m; i++){ %>
							<li class="list-group-item list-group-book" name="tag"
								value="<%=listLoai.get(i).getMaLoai()%>"><a class="list_tag"
								href="SachController?tag=<%=listLoai.get(i).getMaLoai()%>"> <%=listLoai.get(i).getTenLoai()%></a>
							</li>
							<%} %>
						</ul>
					</form>
				</div>
				<div class="col l-9 m-9 right-panel-content"
					style="background-color: white">
					<div id="carouselExampleControls" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="image_sach/slider_1.jpg"
									class="d-block w-100 img-width" alt="...">
							</div>
							<div class="carousel-item">
								<img src="image_sach/slider_2.jpg"
									class="d-block w-100 img-width" alt="...">
							</div>
							<div class="carousel-item">
								<img src="image_sach/slider_3.jpg"
									class="d-block w-100 img-width" alt="...">
							</div>
						</div>
					<!-- 	<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a> -->
					</div>
			
	
						<div class="gird__row home-product">
						
							<%
									/* for (int i = 0; i < n; i++) {
										int j = i;
			                            for(; j<n&&j<i+5; j++){
			                            Sach sach = ds.get(j); */
			                            for(Sach sach : ds){
	
								%>
							<div class="gird_column-2-4 contentPage">
								<!--product item  -->
								<div class="home-product-item">
									<div class="home-product-item__img"
										style="background-image: url('./<%=sach.getAnh()%>');"></div>
									<h3 class="home-product-item__name">
										<a href="ProductController?id=<%=sach.getMasach()%>"><%=sach.getTensach()%></a>
									</h3>
									<h5 class="home-product-item__author"><%=sach.getTacgia()%></h5>
									<div class="home-product-item__prices">
										<span class="item__prices"><%=sach.getGia()%> đ</span>
										<!-- </div>
	                                        <div class="pro-clickbuy"> -->
										<a href="DatHangController?mahang=<%=sach.getMasach()%>"
											name="datmua"><img alt="Đặt mua"
											src="image_sach\buynow.jpg" class="button"></a>
									</div>
									<div class="home-product-item_star">
										<i class="product-item_star-icon far fa-star"></i> <i
											class="product-item_star-icon far fa-star"></i> <i
											class="product-item_star-icon far fa-star"></i> <i
											class="product-item_star-icon far fa-star"></i> <i
											class="product-item_star-icon far fa-star"></i> <span
											class="active-star">(0)</span>
									</div>
								</div>
							</div>
							<% } %>
							<ul id="pagination"></ul>
							<%-- <%i=j;%>
							<% } %> --%>
							
						</div>
	
					</div>
				
			</div>
		</div>
	
	<!-- SECTION Authen -->

	<jsp:include page="form.jsp"></jsp:include>
	<!-- END SECTION Authen -->
	
	<div class="back_home">
		<a id="back-to-top" href="#" class="back-to-top hvr-float"
			role="button" title="Click để lên đầu trang" data-toggle="tooltip"
			data-placement="left" style="display: inline;"> <i
			class="fa fa-chevron-up" aria-hidden="true"></i></a>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"></script>
	<script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
	<script src="js/packed.js"></script>
</body>
</html>