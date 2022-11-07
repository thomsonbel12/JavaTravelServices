<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- reset css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
	integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" href="<c:url value="/assets/img/logo.png"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/fonts/fontawesome-free-6.2.0-web/css/all.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/base.css"/>">

<title>Đăng nhập</title>
</head>

<body>
	<div class="app">
		<header class="app__header">
			<div class="app__header-logo">
				<a href="/ProjectTravelServices/home" class="app__header-logo">
					<img src="<c:url value ="/assets/img/logo.png"/>" alt=""
					class="app__header-logo--link">
				</a>
			</div>
			<div class="app__header-getin">
				<div class="app__header-login">
					<button onclick="location.href='/ProjectTravelServices/login'"
						class="app__header-button">
						<!-- <a href="#" class="app_header-login--link"> -->
						Đăng nhập
						<!-- </a> -->
					</button>
				</div>

				<div class="app__header-signin">
					<button onclick="location.href='/ProjectTravelServices/signup'"
						class="app__header-button">
						<!-- <a href="/ProjectTravelServices/HTML/dangKi.jsp" class="app_header-login--link"> -->
						Tạo tài khoản
						<!-- </a> -->
					</button>
				</div>
			</div>
		</header>

		<div class="app__body">
			<div class="app__body-card login-card">
				<h1 class="app_body-header">Đăng nhập</h1>
				<p>Vui lòng nhập đúng thông tin đăng nhập để có thể truy cập vào
					website</p>
				<div class="app__body-login-method">
					<ul class="app__body-login-method-list">
						<li class="app__body-login-email app__body_login-select">
							<button id="btn-email-login"
								class="app__body-login-btn app__body-login-btn-email"
								onclick="email_login()">EMAIL</button>
						</li>
						<li class="app__body_login-phone app__body_login-select">
							<button id="btn-phone-login"
								class="app__body-login-btn app__body-login-btn-phone"
								onclick="phone_login()">DI ĐỘNG</button>
						</li>
					</ul>
				</div>

				<div class="app__body-card-form">
					<!-- Email -->
					<form id="app__body-card-email" class="app__body-input"
						action="login" method="post">
						<div class="app__body-input-email">
							<label for="email-input">Email</label> <input name="email"
								value="${emailLogin}" type="email" id="email-input"
								class="app__body-input-text" placeholder="Email" required>
						</div>

						<div class="app__body-input-password">
							<label for="password">Mật khẩu</label> <input name="pass-email"
								value="${passEmailLogin}" type="password" id="password"
								class="app__body-input-text" placeholder="Mật khẩu" required>
						</div>

						<div class="app__body-input-bottom">
							<div class="app__body-input-remember-field">
								<input name="remember" value="1" type="checkbox" id="checkbox-remember"
									class="app__body-input-remember-checkbox"> <label
									for="checkbox-remember">Ghi nhớ đăng nhập</label>
							</div>

							<div class="app__body-input-option">
								<div class="app__body-input-forget-pass">
									<a href="/ProjectTravelServices/checkemail" class="app__body-input-forget-pass-link"> <i
										class="fa-solid fa-unlock-keyhole"></i> Quên mật khẩu?
									</a>
								</div>
								<div class="app__body-input-new-account">
									<a href="/ProjectTravelServices/signup"
										class="app__body-input-new-account-link"> <i
										class="fa-solid fa-user-plus"></i> Tạo tài khoản
									</a>
								</div>
							</div>
						</div>

						<div class="login-error" style=" ${displayed_email}">
							<i class="fa-sharp fa-solid fa-circle-exclamation"></i>
							<p class="error">${mess}</p>
						</div>
						<button class="app__body-input-login-btn" type="submit">
							Đăng nhập</button>
					</form>

					<!-- Di động -->
					<form id="app__body-card-phone" class="app__body-input"
						action="login" method="post">
						<div class="app__body-input-phone">
							<label for="phone-input">Số điện thoại</label>
							<div class="app__body-input-phone-number">
								<select name="phone-header" id="phone-header"
									class="app__boby-input-phone-header">
									<option value="84">+84</option>
									<option value="95">+95</option>
									<option value="02">+00</option>
								</select> <input name="phone" value="${phoneLogin}" type="text" id="phone-input"
									class="app__body-input-text" placeholder="Số điện thoại"
									required>
							</div>
						</div>

						<div class="app__body-input-password">
							<label for="password">Mật khẩu</label> <input name="pass-phone"
								type="password" value="${passPhoneLogin}" id="password" class="app__body-input-text"
								placeholder="Mật khẩu" required>
						</div>
						<div class="app__body-input-bottom">
							<div class="app__body-input-remember-field">
								<input name="remember" value="1" type="checkbox"
									class="app__body-input-remember-checkbox"> <label
									for="checkbox-remember">Ghi nhớ đăng nhập</label>
							</div>

							<div class="app__body-input-option">
								<div class="app__body-input-forget-pass">
									<a href="/ProjectTravelServices/checkphone" class="app__body-input-forget-pass-link"> <i
										class="fa-solid fa-unlock-keyhole"></i> Quên mật khẩu?
									</a>
								</div>
								<div class="app__body-input-new-account">
									<a href="dangKi.jsp" class="app__body-input-new-account-link">
										<i class="fa-solid fa-user-plus"></i> Tạo tài khoản
									</a>
								</div>
							</div>

						</div>

						<button class="app__body-input-login-btn" type="submit">Đăng
							nhập</button>
					</form>

					<div action="" class="app__body-input-other-method">
						<div class="other-method-text">
							<p>hoặc đăng nhập bằng</p>
						</div>
						<div class="other-method-wrap">
							<button class="other-method-btn other-method-btn-gg"
								onclick="location.href='https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/ProjectTravelServices/LoginGoogle&response_type=code&client_id=312248185997-3feand2bf5kmuv8962vc3v72r5p4hoa7.apps.googleusercontent.com&approval_prompt=force'">
								<i class="fa-brands fa-google"></i> Google
							</button>
							<button class="other-method-btn other-method-btn-fb"
								onclick="location.href='https://www.facebook.com/dialog/oauth?client_id=515625173274802&redirect_uri=http://localhost:8080/ProjectTravelServices/LoginFacebook'">
								<i class="fa-brands fa-facebook"></i> Facebook
							</button>
							<button class="other-method-btn other-method-btn-tt">
								<i class="fa-brands fa-twitter"></i> Twitter
							</button>
						</div>
					</div>

					<div class="app__body-policy">
						<p>
							Khi đăng nhập, tôi đồng ý với các <a href="">Điều khoản sử
								dụng</a> và <a href="">Chính sách bảo mật</a> của LHT Travel
							Company.
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script>
		var x = document.getElementById("app__body-card-email");
		var y = document.getElementById("app__body-card-phone");
		// var z = document.getElementById("app__body-card-email");

		function email_login() {
			document.getElementById("btn-email-login").style.borderBottom = "2px solid #5392fa"
			document.getElementById("btn-phone-login").style.borderBottom = "1px solid #ccc"
			x.style.display = "block";
			y.style.display = "none";
		}
		function phone_login() {
			document.getElementById("btn-phone-login").style.borderBottom = "2px solid #5392fa"
			document.getElementById("btn-email-login").style.borderBottom = "1px solid #ccc"
			x.style.display = "none";
			y.style.display = "block";
		}
	</script>
</body>

</html>