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
<%@page import="bo.GiaodienBo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fluid">
<%Sach sach =(Sach) session.getAttribute("Sach"); %>

	<div class="add_book">
		<form class="center" method="post" action="NhapController" enctype= "multipart/form-data">
				 <div class="add_book_content">
					  <label class="contten_book">Mã sách</label><br> 
					  <input class="add_book_btn" type="text" name="txtmasach" <%if(sach != null){ %> value="<%=sach.getMasach() %>" <%} %> required> <br>
				  </div>
				  <div class="add_book_content">
					  <label  class="contten_book" >Tên Sách</label> <br>
					  <input class="add_book_btn" type="text" name="txttensach" <%if(sach != null){ %> value="<%=sach.getTensach() %>" <%} %> required> <br>
				  </div>
				  <div class="add_book_content">
					  <label  class="contten_book"> Tác Giả</label> <br>
					  <input class="add_book_btn" type="text" name="txttacgia"  <%if(sach != null){ %> value="<%=sach.getTacgia() %>" <%} %> required><br>
				  </div>
				  <div class="add_book_content">
					  <label  class="contten_book">Giá</label> <br>
					  <input class="add_book_btn" type="number" name="txtgia"  <%if(sach != null){ %> value="<%=sach.getGia()%>" <%} %> required><br>
				  </div>
				  <div class="add_book_content">
					  <label class="contten_book" class="contten_book"> Số Lượng</label> <br>
					  <input class="add_book_btn" type="text" name="txtsoluong"  <%if(sach != null){ %> value="<%=sach.getSoluongcon()%>" <%} %> required ><br>
				  </div>
				  <div class="add_book_content">
					  <label  class="contten_book"> Ngày Nhập</label> <br>
					  <input class="add_book_btn" type="date" name="txtngaynhap"  <%if(sach != null){ %> value="<%=sach.getNgaynhap()%>" <%} %> required><br>
				  </div>
				  <div class="add_book_content">
					  <label  class="contten_book"> Ảnh</label> <br>
					  <input class="add_book_btn image_choose " type="file" name="txtanh"   required><br> 
					  <span><%if(sach != null){ %> <%=sach.getAnh()%><%}%></span>
				  </div>
				  <div class="add_book_content">
					  <label  class="contten_book"> Số Tập</label> <br>
					  <input class="add_book_btn" type="text" name="txtsotap"  <%if(sach != null){ %> value="<%=sach.getSotap() %>" <%} %> required><br>
				  </div>
			
				 <%GiaodienBo bo = new GiaodienBo();
				 ArrayList<LoaiSach> list = new ArrayList<LoaiSach>();
				 list = bo.getloaiSach();
				 %>
				 <div class="add_book_content">
					  <label  class="contten_book_1"> Mã Loại:</label>
					  <select id="maloai" name="txtmaloai" >
					   <%if(sach != null){ %>
					   			<option  >
					   			<%=sach.getMaloai() %>
								</option>	
						<%}else{ %>
					 		<%for(LoaiSach loai :list){ %>
								 <option   >
										<%=loai.getTenLoai()%><%} %>
								</option>	
						<%} %>
					  </select><br>
				  </div>
				  <div class="add_book_btn_submit_">
					  <input class="add_book_btn_submit_1" type="submit" value="ADD">
					  <input class="add_book_btn_submit_1"  type="submit" value="SAVE">
				  </div>
				  <br>
				  
		</form>
	</div> 
	
	<br>
	<% SachBO bo2 = new SachBO() ;
	ArrayList<Sach> list2 = new ArrayList<Sach>();
	list2 = bo2.getSach();
	%>
	
	<div class="table_view">
				<table id="customers">
					<tr>
					  <th>Mã Sách</th>
					  <th>Tên Sách</th>
					  <th>Tác giả</th>
					  <th>Giá</th>
					  <th>Old image</th>
					  <th>Số lượng</th>
					  <th>New image</th>
					  <th>Cập nhật</th>
					   <th>Xóa</th>
					</tr>
					<%for(Sach order : list2) {%>
					<tr>
					  <td><%=order.getMasach() %></td>
					  <td><%=order.getTensach() %></td>
					  <td><%=order.getTacgia() %></td>
					  <td><%=order.getGia() %></td>
					  <td><%=order.getAnh() %></td>
					    <td><%=order.getSoluongcon() %></td>
					  <td><%=order.getAnh() %></td>
					  <td><a href="GiaodienController?masach_select=<%=order.getMasach() %>">select</a></td>
					  <td><span class="delete_book" data-toggle="modal" data-target="#delete_Book">Delete</span></td>
					</tr>
	<div class="modal" id="delete_Book" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	          <p>Bạn có chắc là muốn  xóa quyển  sách này không?</p>
	        </div>
	        <div class="modal-footer">
	        <a class="btn_delete" href="XoaSachController?masach=<%=order.getMasach()%>">Delete</a>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Quay lại</button>
	        </div>
	     </div>
	    </div>  
	 </div>
					<%} %>
				</table>
	</div>
	
	
	<div class="modal" id="successdelete" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	          <p>Xóa Thành Công</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Quay lại</button>
	        </div>
	      </div>
	      
	    </div>
  </div>
</div>
<%if((boolean)session.getAttribute("ShowdeleteBook") == true){ %> 
	<script type="text/javascript">
	        $(window).on('load',function(){
	            $('#successdelete').modal('show');
	        });
	</script>
	
 <%
session.removeAttribute("ShowdeleteBook"); 
 
} %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>