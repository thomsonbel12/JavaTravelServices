<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>Travel Services</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link rel="stylesheet" href="<c:url value="/assets/css/cart.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/book.css"/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
<body>

	<div id="app" class="app__Book">
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
						class="rgbRed-text" href="/ProjectTravelServices/cartdetail">
							<i class="fa-solid fa-cart-shopping"> <span
								class="cart-item-number total_cart_room total_cart_room"></span>
						</i>
					</a>
						<div class="shopping_cart-items">
							<div class="cart-text">Danh sách của tôi</div>

							<div class="cart-list">

								<c:forEach items="${sessionScope.listCarts}" var="y">
									<div onclick="location.href='room?hotelID=${y.getHotel_id()}'"
										class="cart-item">
										<div class="cart-item-img">
											<img src="${y.getImage()}" alt="">
										</div>
										<div class="cart-item-detail">
											<div class="cart-item-name">${y.getType()}-
												${y.getName_hotel()}</div>
											<div class="cart-item-desc">
												<div class="cart-item-date">
													<label style="color: #333;">Ngày nhận phòng</label>
													<div class="cart-day">${y.getCheckIn_date() == null ? 'Chưa chọn ngày' : ''}
														${y.getCheckIn_date()}</div>
												</div>
												<div class="cart-item-people">
													<div style="color: #333;">1 phòng</div>
													<div>${y.getAdult()}người lớn, ${y.getChildren()} trẻ
														em</div>
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
		<div class="app__body">
			<!-- <a href="./Checkout.html"></a> -->
			<div class="app__body-header">
				<ul class="body-header-bar">
					<li class="active"><span id="step-1" class="step">1</span> <span
						class="step-text">Thông tin khách hàng</span></li>

					<li><span id="step-2" class="step"> <i
							class="fa-solid fa-check"></i>
					</span> <span class="step-text">Xác nhận thanh toán</span></li>
				</ul>
			</div>

			<form style="width: 100%;" action="checkout" method="post">
				<div class="app__body-content">
					<div class="body-left-content">
						<div class="body-left-item body-left-header">
							<i class="fa-regular fa-circle-user"></i> <span
								class="body-left-header-text">Xin Chào <span
								class="rgbRed-text">${sessionScope.user_book.getName_user()}</span>
								!
							</span>
						</div>
						<div class="body-left-item user-info-check">
							<div class="user-info-header">
								<h4 style="color: #333;">Chi tiết liên lạc</h4>
								<h5>Vui lòng xác nhận các thông tin sau !!</h5>
							</div>

							<div class="user-info">
								<div class="user-info-item user-info-name">
									<div class="user-info-input">
										<label for="user-name">Họ và Tên</label> <input
											name="user-name" id="user-name" type="text"
											placeholder="Họ và Tên"
											value="${sessionScope.user_book.getName_user()}">
										<p style="color: rgb(255, 0, 0);">${nameerror != null  ?
											'Không được bỏ trống tên người dùng!' : ''}</p>
									</div>
								</div>
								<div class="user-info-item user-info-email">
									<div class="user-info-input">
										<label for="user-email">Email</label> <input name="user-email"
											id="user-email" type="email" placeholder="Email"
											value="${sessionScope.user_book.getEmail()}">
										<p style="color: rgb(255, 0, 0);">${emailerror != null
											? 'Không được bỏ trống email!' : ''}</p>
									</div>
								</div>
								<div class="user-info-item user-info-name">
									<div class="user-info-input">
										<label for="user-phone">Số điện thoại</label> <input
											name="user-phone" id="user-phone" type="text"
											placeholder="Số điện thoại"
											value="${sessionScope.user_book.getPhone_number()}">
										<p style="color: rgb(255, 0, 0);">${phoneerror != null
											? 'Không được bỏ trống số điện thoại!' : ''}</p>
									</div>
								</div>
								<div class="user-info-item user-info-name">
									<div class="user-info-input">
										<label>Quốc gia</label> <select name="country" id="country">

										</select>
									</div>
								</div>
							</div>
						</div>

						<div class="body-left-item body-left-submit-btn">
							<div class="policy-text"
								style="font-size: 12px; width: 60%; color: #aaa;">
								Thực hiện bước tiếp theo đồng nghĩa với việc bạn chấp nhận tuân
								theo <a href="" class="blue-text">Điều khoản sử dụng</a> và <a
									href="" class="blue-text">Chính sách bảo mật</a> của <span
									class="rgbRed-text">LHT C.</span>
							</div>

							<div class="body-submit">
								<button type="submit" id="submit_book" class="padding-8 blue-button">Đặt
									phòng ngay</button>
							</div>
						</div>
					</div>
					<div class="body-right-content">
						<div class="body-right-item right-room-summary">
							<div class="right-room-header fontWeight-600 semiBlack-text">
								<!-- <div> -->
								TÓM TẮT DANH SÁCH PHÒNG
								<!-- </div> -->
								<div class="right-room-header-num-room fontWeight-500">
									<div>
										( <span id="total_rooms"
											class="fontWeight-600 rgbRed-text total_room"></span>
										&nbsp;Phòng )
									</div>

									<div>
										Tổng : &nbsp;&nbsp;&nbsp; <span id="total_money"
											class=" rgbRed-text fontWeight-600"></span> &nbsp;VNĐ
									</div>
								</div>
							</div>
							<div class="right-room-list">


								<c:forEach items="${sessionScope.listCartsSelected}" var="y">
									<div class="room-content">
										<div class="room-content-header">
											<div class="room-tag">
												<i class="fa-solid fa-hotel"></i> <span
													class="room-tag-item room-tag-name fontWeight-600 black-text">KHÁCH
													SẠN</span> <span
													class="room-tag-item room-tag-city semiBlack-text">(HỒ
													CHÍ MINH)</span>
											</div>

										</div>
										<div class="room-content-body">
											<div class="room-body-item room-img-name">
												<div class="room-img">
													<img src="${y.getImage()}" alt="">
												</div>

												<div class="room-name-money semiBlack-text fontWeight-600">
													<div class="room-name">${y.getType()}-
														${y.getName_hotel()}</div>
													<div class="room-money">
														<i class="fa-regular fa-money-bill-1 rgbRed-text"></i> <span
															class="money-1-day rgbRed-text">${y.getPrice_room()}</span>
														<span class="money-currency">VNĐ</span> ( <span
															class="rgbRed-text fontWeight-600">1</span> Ngày )
													</div>
												</div>

											</div>

											<div class="room-body-item room-book-detail">
												<div class="room-date semiBlack-text">
													<i class="fa-solid fa-calendar blue-text"></i> <span>
														Từ &nbsp;</span> <input id="checkin-date"
														class="checkin_date rgbRed-text fontWeight-600" disabled
														value="${y.getCheckIn_date()}"> <span>&nbsp;
														đến &nbsp;</span> <input id="checkout-date"
														class="checkout_date rgbRed-text fontWeight-600" disabled
														value="${y.getCheckOut_date()}">
													<!-- <span class="border-bar"></span> -->

													<span>&nbsp;&nbsp;&nbsp;&nbsp;Tổng số ngày : &nbsp;</span>
													<span class="total_days rgbRed-text fontWeight-600"></span>
													<span>&nbsp; Ngày</span>
												</div>

												<div class="room-people semiBlack-text">
													<i class="fa-solid fa-users blue-text"></i> <span
														class="room_num rgbRed-text fontWeight-600">1</span> <span>
														Phòng, </span> <span class="adult_num rgbRed-text fontWeight-600">${y.getAdult()}</span>
													<span>Người lớn, </span> <span
														class="adult_num rgbRed-text fontWeight-600">${y.getChildren()}</span>
													<span>Trẻ em.</span>
												</div>

												<div class="room-total-money">
													<i class="fa-solid fa-money-check-dollar"></i> <span
														class="semiBlack-text fontWeight-600">Tổng số tiền
														: &nbsp;</span> <span
														class="room-total-money-text rgbRed-text fontWeight-600"></span>
													<span class="money-currency semiBlack-text">&nbsp;VNĐ</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>
						<div class="body-right-item"></div>
						<div class="body-right-item"></div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<script type="module" src="<c:url value="/script/numbeWithComma.js" />"></script>
	<script type="module" src="<c:url value="/script/countDays.js" />"></script>
	<script type="module" src="<c:url value="/script/book.js" />"></script>
	<script src="<c:url value="/script/loadCountry.js" />"></script>
	<script type="module" src="<c:url value="/script/cartHeader.js" />"></script>

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
		// function hideShowAddForm() {
		//     for (let i = 0; i < ShowAddForm.length; i++)
		//         ShowAddForm[i].classList.remove('show');
		// }
		// function hideShowSearchForm() {
		//     for (let i = 0; i < ShowSearchForm.length; i++)
		//         ShowSearchForm[i].classList.remove('show');
		// }
		// function hideShowDatePick(){
		//     for (let i = 0; i < calendarShow.length; i++)
		//         calendarShow[i].classList.remove('show');
		// }
		function autoHide() {
			hideUserMenu();
			// hideShowAddForm();
			// hideShowSearchForm();
			// hideShowDatePick();
		}
	</script>

</body>
</html>