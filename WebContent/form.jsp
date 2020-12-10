<%@page import="bean.KhachHangBean"%>
<%@page import="bean.AdminBean"%>
<%@page import="bean.GioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Authen form Login -->
	<form action="LoginController" method="post" class="modal"
		id="LoginModalForm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<!--Content-->
			<div class="modal-content form-elegant">
				<div class="modal-header text-center">
					<h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3"
						id="myModalLabel">
						<strong>Login</strong>
					</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-4">
					<div class="md-form mb-5">
						<input type="name" id="Form-email1" value="${after.UserName}"
							name="username" class="form-control validate"
							placeholder="User name...." required> <label
							data-error="wrong" data-success="right" for="Form-email1">Your
							name</label> <span name="errorName" style="color: red;">${errors.failUser}</span>
					</div>

					<div class="md-form pb-3">
						<input type="password" id="Form-pass1" name="pass"
							class="form-control validate" placeholder="Password...." required>
						<label data-error="wrong" data-success="right" for="Form-pass1">Your
							password</label> <span name="errorName" style="color: red;">${errors.failpass}</span>
						<p class="font-small blue-text d-flex justify-content-end">
							Forgot <a href="#" class="blue-text ml-1"> Password?</a>
						</p>
					</div>

					<div class="text-center mb-3">
						<button type="submit"
							class="btn blue-gradient btn-block btn-rounded z-depth-1a">Login</button>
					</div>
				</div>
				<div class="modal-footer mx-5 pt-3 mb-1">
					<p class="font-small grey-text d-flex justify-content-end">
						Not a member? <a href="" class="close1" data-dismiss="modal"
							aria-label="Close" data-toggle="modal"
							data-target="#modalRegisterForm"> Sign Up</a>
					</p>
				</div>
			</div>
		</div>
	</form>
	<!-- Athuen form sign Up -->
	<form action="AddAcountUser" method="post" class="modal "
		id="modalRegisterForm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<!--Content-->
			<div class="modal-content form-elegant">
				<div class="modal-header text-center">
					<h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3"
						id="myModalLabel">
						<strong>Sign Up</strong>
					</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-4">
					<div class="md-form mb-5">
						<input type="name" value="${after.inputName}" name="inputName"
							id="Form-Yrname" class="form-control validate"
							placeholder="Your name...." required> <span
							name="errorName" style="color: red;">${errors.YrName}</span><br>

					</div>
					<div class="md-form mb-5">
						<input type="name" id="Form-Usname" value="${after.username}"
							name="username" class="form-control validate"
							placeholder="User name...." required> <span
							name="errorName" style="color: red;">${errors.UsName}</span> <br>
					</div>
					<div class="md-form mb-5">
						<input type="email" id="Form-email1" value="${after.email}"
							name="email" class="form-control validate"
							placeholder="Email...." required> <span name="errorName"
							style="color: red;">${errors.Email}</span> <br>
					</div>
					<div class="md-form mb-5">
						<input type="password" id="Form-pass1" value="${after.password}"
							name="password" class="form-control validate"
							placeholder="Password...." required> <span
							name="errorName" style="color: red;">${errors.Pass}</span> <br>
					</div>
					<div class="md-form mb-5">
						<input type="text" id="Form-phone" value="${after.phone}"
							name="phone" class="form-control validate"
							placeholder="Your Phone...." required> <span
							name="errorName" style="color: red;">${errors.Phone}</span> <br>
					</div>
					<div class="md-form pb-3">
						<input type="address" id="Form-address" value="${after.address}"
							name="address" class="form-control validate"
							placeholder="Address..." required> <span name="errorName"
							style="color: red;">${errors.Address}</span> <br>
					</div>
					<div class="text-center mb-3">
						<button type="submit"
							class="btn blue-gradient btn-block btn-rounded z-depth-1a">Sign
							Up</button>
					</div>
					<div class="md-form pb-3">
						<span class="error" name="error-confirm-password"
							style="color: red;">${errors.signup_fail}</span>
					</div>
				</div>
				<div class="modal-footer mx-5 pt-3 mb-1">
					<p class="font-small grey-text d-flex justify-content-end">
						Have Account <a href="" class="close1" data-dismiss="modal"
							aria-label="Close" data-toggle="modal"
							data-target="#elegantModalForm"> Login</a>
					</p>
				</div>
			</div>
		</div>
	</form>