<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>Hồ sơ của tôi</title>
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
	href="<c:url value="/assets/css/CartDetail.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/cart.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/myProfile.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/forgetPassMail.css"/>">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>


<body>

	<div id="app" class="app__myProfile">
		<div id="header" class="app__header">
			<div class="app__header-logo">
				<a href="/ProjectTravelServices/home" class="app__header-logo">
					<img src="<c:url value ="/assets/img/logo.png"/>" alt=""
					class="app__header-logo--link">
				</a>
			</div>
			<c:if test="${sessionScope.acc==null}">
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
							<!-- <a href="dangKi.html" class="app_header-login--link"> -->
							Tạo tài khoản
							<!-- </a> -->
						</button>
					</div>

					<div class="app__header-user" style="display: none">
						<div class="app__header-user-display"></div>
						<div class="app__header-user-menu"></div>
					</div>
				</div>
			</c:if>

			<c:if test="${sessionScope.acc!=null}">
				<div class="app__header-option">
					<a class="rgbRed_OutlineButton button-padding_12">Đăng kí cho
						thuê nhà</a> <span class="shopping_cart"> <a
						class="rgbRed-text" href="/ProjectTravelServices/cartdetail"> <i
							class="fa-solid fa-cart-shopping"> <span
								class="cart-item-number total_cart_room total_cart_room"></span>
						</i>
					</a>
						<div class="shopping_cart-items">
							<div class="cart-text">Danh sách của tôi</div>

							<div class="cart-list">
								<c:forEach items="${sessionScope.listCarts}" var="y">
									<div onclick="location.href='room?hotelID=${y.getHotel_id()}'" class="cart-item">
										<div class="cart-item-img">
											<img
												src="${y.getImage()}"
												alt="">
										</div>
										<div class="cart-item-detail">
											<div class="cart-item-name">${y.getType()} - ${y.getName_hotel()}</div>
											<div class="cart-item-desc">
												<div class="cart-item-date">
													<label style="color: #333;">Ngày nhận phòng</label>
													<div class="cart-day">${y.getCheckIn_date()}</div>
												</div>
												<div class="cart-item-people">
													<div style="color: #333;">1 phòng</div>
													<div>${y.getAdult()} người lớn, ${y.getChildren()} trẻ em</div>
												</div>
												<div class="cart-item-money">
													${y.getPrice_room()} &nbsp;<span>VNĐ</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="cart-item cart-item-detail-link">
								<p>
									Có <span class="rgbRed-text fontWeight-700 total_cart_room"></span>
									phòng trong danh sách
								</p>
								<a class="rgbRed_OutlineButton button-padding_12"
									href="/ProjectTravelServices/cartdetail">Chi tiết danh sách</a>
							</div>
						</div>
					</span>
				</div>
				<div class="app__header-user">
					<div class="app__header-user-display">
						<!-- <div class="app__header-user-display" onclick="user_menu_click()"> -->
						<div class="app__header-user-btn">
							<img src="${sessionScope.avatar}" alt="" class="user-img">
						</div>
						<i class="fa-sharp fa-solid fa-caret-down"></i>

					</div>

					<div class="app__header-user-menu">
						<div class="user-menu-text">TÀI KHOẢN CỦA TÔI</div>
						<div class="user-menu-option">
							<ul>
								<li><i class="fa-solid fa-list"></i> <!-- <a href="">Đơn đặt chỗ của tôi</a> -->
									Đơn đặt chỗ của tôi</li>

								<li><i class="fa-solid fa-envelope"></i> <!-- <a href="">Hộp thư</a> -->
									Hộp thư</li>

								<li><i class="fa-solid fa-heart"></i> <!-- <a href="">Hồ sơ của tôi</a> -->
									Danh sách yêu thích</li>

								<li onclick="location.href='/ProjectTravelServices/myprofile'"><i
									class="fa-solid fa-address-card"></i> Hồ sơ của tôi</li>

								<span> Đặc biệt </span>

								<li class="landlord-register"><i
									class="fa-solid fa-house-flag"></i> Đăng kí cho thuê nhà</li>
								<button class="user-menu-option-logout"
									onclick="location.href='logout'">
									<i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
								</button>

							</ul>
						</div>
					</div>
				</div>
			</c:if>

		</div>

		<div id="body" class="app__body">
			<div class="app__body-left-menu">
				<ul class="left-menu-items">
					<li class="left-menu-item left-menu-cart-list"><a
						href="/ProjectTravelServices/cartdetail"> <i
							class="fa-sharp fa-solid fa-clipboard"></i> Giỏ hàng của tôi
					</a></li>
					<li class="left-menu-item left-menu-history-list"><a href="">
							<i class="fa-solid fa-clipboard-check"></i> Lịch sử du lịch
					</a></li>
					<li class="left-menu-item"><a href=""> <i
							class="fa-solid fa-star"></i> Danh sách yêu thích
					</a></li>
					<li class="left-menu-item left-menu-profile"><a
						href="/ProjectTravelServices/myprofile"> <i
							class="fa-solid fa-address-card"></i> Hồ sơ của tôi
					</a></li>
				</ul>

			</div>
			<div class="app__body-right-content">
				<div class="right-content-header">
					<div class="header-banner">
						<img
							src="https://cdn6.agoda.net/images/LOY-5878/default/vip-banner-agoji-non-vip.svg"
							alt="">
						<div class="header-banner-text">
							<span class="fontWeight-700"> Bạn có muốn trở thành khách
								VIP không ? </span> <br> <br> <span style="font-size: 16px">
								Hãy hoàn tất việc đặt phòng và thanh toán đúng hạn để mở khóa
								các dịch vụ và giảm giá, và hưởng dịch vụ đặc biệt. </span>
						</div>
						<img
							src="https://cdn6.agoda.net/images/LOY-5878/default/vip-banner-agoji-non-vip.svg"
							alt="">

						<!-- <img  src="../assets/img/banner_1.png" alt=""> -->

					</div>
					<div class="header-option"></div>
				</div>

				<div class="right-content-body">
					<div class="user-information">
						<h1>Thông tin người dùng</h1>
						<form action="editnameuser" method="post">
							<div class="user-content user-name-content">
								<div class="user_name_inf user_inf_item">
									<div class="user_inf_left user_name_inf_left">
										<div class="img_user_inf">
											<img class="img_inf" src="${avatar_edit}" alt=""
												class="user-img">
										</div>
										<div class="display_name">
											<span class="display_label name_label">Họ & Tên</span> <span
												class="text_content_inf">${name_edit}</span>
										</div>
									</div>
									<div class="edit_username_inf">
										<a class="rgbRed-text edit_btn">Chỉnh sửa</a>
									</div>
								</div>
								<div class="edit_username edit_item">
									<div class="edit-content">
										<label for="new_user_name">Nhập tên mới</label> <input
											name="new_name" id="new_user_name"
											class="app__body-input-text" type="text">
									</div>

									<div class="btn_xacnhan_huy">
										<span
											class="btn_huy rgbRed_OutlineButton button-padding_12 ">Hủy</span>
										<button type="submit"
											class="btn_xacnhan blue-button button-padding_12 ">Xác
											nhận</button>
									</div>
								</div>
							</div>
						</form>

						<form action="editemail" method="post">
							<div class="user-content user-email-content">
								<div class="user_email_inf user_inf_item">
									<div class="user_inf_left">
										<span class="display_label">Email</span> <span
											class="text_content_inf">${email_edit}</span>
									</div>
									<div class="edit_email_inf">
										<a class="rgbRed-text edit_btn">Chỉnh sửa</a>
									</div>

								</div>

								<div class="edit_email edit_item">
									<div class="edit-content">
										<label for="new_email">Nhập Email mới</label> <input
											name="new_email" id="new_email" class="app__body-input-text"
											type="email">
									</div>

									<div class="btn_xacnhan_huy">
										<span
											class="btn_huy rgbRed_OutlineButton button-padding_12 ">Hủy</span>
										<button type="submit"
											class="btn_xacnhan blue-button button-padding_12 ">Xác
											nhận</button>
									</div>
								</div>
							</div>
						</form>

						<form action="editphonenumber" method="post">
							<div class="user-content user-phone-content">
								<div class="phone_number_inf user_inf_item">
									<div class="user_inf_left">
										<span class="display_label">Số điện thoại</span> <span
											class="text_content_inf">${phonenumber_edit}</span>
									</div>

									<div class="edit_phone_number_inf">
										<a class="rgbRed-text edit_btn">Chỉnh sửa</a>
									</div>
								</div>
								<div class="edit_phone_number edit_item">
									<div class="edit-content">
										<label for="new_phone_num">Nhập số điện thoại mới</label> <input name="new_phonenumber"
											id="new_phone_num" class="app__body-input-text" type="text">
									</div>

									<div class="btn_xacnhan_huy">
										<span
											class="btn_huy rgbRed_OutlineButton button-padding_12 ">Hủy</span>
										<button type="submit" class="btn_xacnhan blue-button button-padding_12 ">Xác
											nhận</button>
									</div>
								</div>
							</div>
						</form>

						<form action="editpassword" method="post">
							<div class="user-content user-password-content">
								<div class="password_inf user_inf_item">
									<div class="user_inf_left">
										<span class="display_label">Mật khẩu</span> <input disabled
											type="password" class="text_content_inf"
											value="******">
									</div>

									<div class="edit_password_inf">
										<a class="rgbRed-text edit_btn">Chỉnh sửa</a>
									</div>
								</div>
								<div class="edit_phone_number edit_item">
									<div class="edit-content">
										<div class="pass_field old_pass_field">
											<label for="old_pass">Nhập mật khẩu cũ</label>

											<div class="pass_input">
												<input name="old_pass" type="password" id="old_pass"
													class="app__body-input-text" type="text"> <i
													class="show_pass_icon fa-solid fa-eye"></i> <i
													style="display: none;"
													class="hide_pass_icon fa-solid fa-eye-slash"></i>
											</div>

										</div>

										<div class="pass_field new_pass_field">
											<label for="new_pass">Nhập mật khẩu mới</label>

											<div class="pass_input">
												<input name="new_pass" type="password" id="new_pass"
													class="app__body-input-text" type="text"> <i
													class="show_pass_icon fa-solid fa-eye"></i> <i
													style="display: none;"
													class="hide_pass_icon fa-solid fa-eye-slash"></i>
											</div>
										</div>

										<div class="pass_field new_pass_repeat_field">
											<label for="new_pass_repeat">Nhập lại mật khẩu mới</label>

											<div class="pass_input">
												<input name="re_new_pass" type="password" id="new_pass_repeat"
													class="app__body-input-text" type="text"> <i
													class="show_pass_icon fa-solid fa-eye"></i> <i
													style="display: none;"
													class="hide_pass_icon fa-solid fa-eye-slash"></i>
											</div>
										</div>
									</div>

									<div class="btn_xacnhan_huy">
										<span
											class="btn_huy rgbRed_OutlineButton button-padding_12 ">Hủy</span>
										<button type="submit" class="btn_xacnhan blue-button button-padding_12 ">Xác
											nhận</button>
									</div>
								</div>
							</div>
						</form>
						

					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="<c:url value="./script/myProfile.js"/>"></script>

	<!-- Mở menu user -->
	<script>
		const app = document.querySelector('.app__header-user-display');
		const menuClick = document.querySelector('.app__header-user-menu');
		function user_menu_click() {
			// hideUserMenu();
			// hideShowAddForm();
			// hideShowSearchForm();
			menuClick.classList.toggle("show");
		}

		app.addEventListener('click', user_menu_click);
		menuClick.addEventListener('click', function() {
			event.stopPropagation();
		});
		app.addEventListener('click', function() {
			event.stopPropagation();
		});
	</script>


	<script>
		document.onclick = function() {
			autoHide();
		};

		//auto hide
		function hideUserMenu() {
			menuClick.classList.remove('show');
		}
		function hideShowAddForm() {
			for (let i = 0; i < ShowAddForm.length; i++)
				ShowAddForm[i].classList.remove('show');
		}
		// function hid
		function hideShowDatePick() {
			for (let i = 0; i < calendarShow.length; i++)
				calendarShow[i].classList.remove('show');
		}
		function autoHide() {
			hideUserMenu();
			// hideShowAddForm();
			// hideShowSearchForm();
			// hideShowDatePick();
		}
	</script>

	<script type="module" src="<c:url value="/script/numbeWithComma.js" />"></script>
	<script type="module" src="<c:url value="/script/cartHeader.js"/>"></script>
</body>
</html>