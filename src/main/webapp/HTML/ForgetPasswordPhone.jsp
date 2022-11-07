<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>Thay đổi mật khẩu</title>
<!-- Required meta tags -->
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
<link rel="stylesheet" href="<c:url value="/assets/css/calendar.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/forgetPassMail.css"/>">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
<body>
	<div class="app__forgetpassMail">
		<header class="app__header">
			<div class="app__header-logo">
				<a href="/ProjectTravelServices/home" class="app__header-logo">
					<img src="<c:url value ="/assets/img/logo.png"/>" alt=""
					class="app__header-logo--link">
				</a>
			</div>
			<div class="app__header-getin">
				<div class="app__header-login">
					<button onclick="location.href='dangNhap.html'"
						class="app__header-button">
						<!-- <a href="#" class="app_header-login--link"> -->
						Đăng nhập
						<!-- </a> -->
					</button>
				</div>

				<div class="app__header-signin">
					<button onclick="location.href='dangKi.html'"
						class="app__header-button">
						<!-- <a href="dangKi.html" class="app_header-login--link"> -->
						Tạo tài khoản
						<!-- </a> -->
					</button>
				</div>
			</div>
		</header>

		<div class="app__body">
			<div class="app__body-card login-card">
				<h1 class="app_body-header">
					Quên mật khẩu <span style="color: rgb(207, 32, 97);">Di động</span>
				</h1>
				<p>Vui lòng nhập đúng Số điện thoại để có được được gửi mã tạo
					lại mật khẩu</p>
				<div class="app__body-login-method">
					<ul class="app__body-login-method-list">
						<li class="app__body-login-email app__body_login-select">
							<button id="btn-email-login"
								class="app__body-login-btn app__body-login-btn-email"
								onclick="email_login()">Số di động</button>
						</li>
						<!-- <li class="app__body_login-phone app__body_login-select">
                            <button id="btn-phone-login" class="app__body-login-btn app__body-login-btn-phone"
                                    onclick="phone_login()">
                                DI ĐỘNG
                            </button>
                        </li> -->
					</ul>
				</div>

				<div class="app__body-card-form">
					<!-- Phone -->
					<c:if test="${phoneCheck==null}">
					<form action="checkphone" method="post"
						id="change-pass-phone-check" class="app__body-input">
						<div class="app__body-input-email">
							<label for="phone-input">Di động</label> <input name="phone_login" type="text"
								id="phone-input" class="app__body-input-text"
								placeholder="Phone" required>
						</div>
						<div class="app__body-input-option">
							<div class="app__body-input-forget-pass">
								<a href="/ProjectTravelServices/login"
									class="app__body-input-forget-pass-link"> <i
									class="fa-solid fa-unlock-keyhole"></i> Đăng nhập
								</a>
							</div>
							<div class="app__body-input-new-account">
								<a href="/ProjectTravelServices/signup"
									class="app__body-input-new-account-link"> <i
									class="fa-solid fa-user-plus"></i> Tạo tài khoản
								</a>
							</div>
						</div>
						<c:if test="${sessionScope.errorphone1!=null}">
							<div id="change-pass-error" class="login-error">
								<i class="fa-sharp fa-solid fa-circle-exclamation"></i>
								<p class="error">${errorphone1}</p>
							</div>
						</c:if>

						<button type="submit" id="change-pass"
							class="app__body-input-login-btn">Kiểm tra Số điện thoại</button>
					</form>
					</c:if>
					
					<c:if test="${codeCheckPhone!=null}">
						<form action="sendcodephone" method="post" id="change-pass-code-check"
							action="" class="app__body-input">
							<div id="code-wrap"
								class="app__body-input-password app__body-input-code">
								<span> <label for="code">Nhập mã xác thực được
										gửi về số điện thoại</label> <input name="code-input-phone" type="text" id="code"
									class="app__body-input-text" placeholder="Sent code" required>
								</span> <span style="align-self: flex-end; height: 100%;"> <a
									href="/ProjectTravelServices/sendcode">Gửi lại mã</a>
								</span>

							</div>
							<div class="app__body-input-option">
								<div class="app__body-input-forget-pass">
									<a href="/ProjectTravelServices/login"
										class="app__body-input-forget-pass-link"> <i
										class="fa-solid fa-unlock-keyhole"></i> Đăng nhập
									</a>
								</div>
								<div class="app__body-input-new-account">
									<a href="/ProjectTravelServices/signup"
										class="app__body-input-new-account-link"> <i
										class="fa-solid fa-user-plus"></i> Tạo tài khoản
									</a>
								</div>
							</div>
							<c:if test="${errorphone2!=null}">
								<div id="change-pass-error" class="login-error">
									<i class="fa-sharp fa-solid fa-circle-exclamation"></i>
									<p class="error">Mã xác thực không hợp lệ vui lòng kiểm tra
										lại.</p>
								</div>
							</c:if>

							<button id="change-pass" type="submit"
								class="app__body-input-login-btn">Tiếp tục</button>
						</form>
					</c:if>
					
					<c:if test="${resetPassPhone!=null}">
						<form action="resetpasswordbyphone" method="post"
							id="change-pass-email-check" class="app__body-input">
							<div class="app__body-input-password">
								<label for="password">Mật khẩu Mới</label> <input name="pass-phone-input"
									type="password" id="password" class="app__body-input-text"
									placeholder="Mật khẩu mới" required>
							</div>

							<div
								class="app__body-input-password app__body-input-password-repeat">
								<label for="password-repeat">Nhập lại Mật khẩu</label> <input name="repass-phone-input"
									type="password" id="password-repeat"
									class="app__body-input-text" placeholder="Nhập lại Mật khẩu"
									required>
							</div>
							<div class="app__body-input-bottom">
								<!-- <div class="app__body-input-remember-field">
                                <input type="checkbox" id="checkbox-remember" class="app__body-input-remember-checkbox">
                                <label for="checkbox-remember">Ghi nhớ đăng nhập</label>
                            </div> -->

								<div class="app__body-input-option">
									<div class="app__body-input-forget-pass">
										<a href="/ProjectTravelServices/login"
											class="app__body-input-forget-pass-link"> <i
											class="fa-solid fa-unlock-keyhole"></i> Đăng nhập
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

							<!-- <div class="login-error">
                            <i class="fa-sharp fa-solid fa-circle-exclamation"></i>
                            <p class="error">Địa chỉ email hoặc mật khẩu không đúng.</p>
                        </div> -->
                        
                        <c:if test="${errorphone3!=null}">
								<div id="change-pass-error" class="login-error">
									<i class="fa-sharp fa-solid fa-circle-exclamation"></i>
									<p class="error">Mã xác thực không hợp lệ vui lòng kiểm tra
										lại.</p>
								</div>
							</c:if>
							
							<button id="change-pass" type="submit"
								class="app__body-input-login-btn">Đặt lại mật khẩu</button>
						</form>
					</c:if>
					

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

	<script src="/script/emptyText.js"></script>
	<script>
		const mail = document.getElementById('email-input');
		const code_wrap = document.getElementById('code-wrap');
		const code = document.getElementById('code');
		const new_pass = document.getElementById('password');
		const new_pass_rep = document.getElementById('password-repeat');
		const change_pass_btn = document.getElementById('change-pass');
		const change_pass_error = document.getElementById('change-pass-error');

		const change_pass_form = document.getElementById('change-pass-form');

		if (isEmptyOrWhitespace(mail.value)) {
			code_wrap.style.display = "none";
		} else {
			code_wrap.style.display = "flex";

		}
		if (isEmptyOrWhitespace(mail.value) || isEmptyOrWhitespace(code.value)
				|| isEmptyOrWhitespace(new_pass.value)
				|| isEmptyOrWhitespace(new_pass_rep.value)) {
			change_pass_btn.style.opacity = "0.5";
			change_pass_btn.style.cursor = "default";

			change_pass_btn.setAttribute('disabled', 'disabled');
		} else {
			change_pass_btn.style.opacity = "1";
			change_pass_btn.style.cursor = "pointer";
			change_pass_btn.removeAttribute('disabled', 'disabled');

		}
		change_pass_form.addEventListener('input', function() {
			if (isEmptyOrWhitespace(mail.value)) {
				code_wrap.style.display = "none";
			} else {
				code_wrap.style.display = "flex";

			}
			if (isEmptyOrWhitespace(mail.value)
					|| isEmptyOrWhitespace(code.value)
					|| isEmptyOrWhitespace(new_pass.value)
					|| isEmptyOrWhitespace(new_pass_rep.value)) {
				change_pass_btn.style.opacity = "0.5";
				change_pass_btn.style.cursor = "default";
				change_pass_btn.setAttribute('disabled', 'disabled');
			} else {
				change_pass_btn.style.opacity = "1";
				change_pass_btn.style.cursor = "pointer";
				change_pass_btn.removeAttribute('disabled', 'disabled');
			}

			change_pass_btn.addEventListener('click', function() {
				change_pass_error.style.display = "flex"
			})
		})
	</script>
</body>
</html>