<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="<c:url value="/assets/css/checkin.css"/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
<body>
	<div id="app" class="app__checkin">
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
													<div class="cart-day">${y.getCheckIn_date()}</div>
												</div>
												<div class="cart-item-people">
													<div style="color: #333;">1 phòng</div>
													<div>${y.getAdult()}ngườilớn,${y.getChildren()}trẻem</div>
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
									href="./HTML/cartDetail.jsp">Chi tiết danh sách</a>
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
			<div class="info-checkin">
				<img class="info_img" src="${Hotels_Image}" alt="">
				<div id="text_information">
					<h2 id="name_checkin">${Hotel_Name}</h2>
					<div id="address_checkin">
						<img id="icon_map"
							src="https://vnreview.vn/image/20/36/36/2036366.jpg" alt="">
						<h3 id="text_address_checkin">${Hotel_Address}</h3>
					</div>
					<p id="decription_checkin">${Decription}</p>
					<div id="benefit">
						<h1>Hưởng các lợi ích đặc biệt dành cho thời gian ở của quý
							khách</h1>
						<div id="list_benefit">
							<c:forEach items="${listBenefits}" var="o">
								<div class="list_member">
									<img class="Mark"
										src="https://phongthuyxanh.vn/wp-content/uploads/d%E1%BA%A5u-t%C3%ADch.png"
										alt="">
									<p>${o.getBenefit_name()}</p>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<div id="rooms_infomation">
					<c:forEach items="${listRooms}" var="o">
						<div class="room">
							<img class="room-img" src="${o.getImage()}" alt="">
							<div class="room-inf">
								<h2>Loại phòng: ${o.getType()}</h2>
								<h2>
									Số khách: <span class="max_adult_num">${o.getAdult()}</span>
									người lớn, <span class="max_child_num">${o.getChildren()}</span>
									trẻ em
								</h2>
								<h2>Giá: ${o.getPrice()} VND</h2>
								<h2>
									Số phòng còn trống: <span class="max_available_num">${o.getAvailable_Room()}</span>
								</h2>
								<div style="width: 100%;" class="content-input-date-select">
									<div class="input-date-wrap input-date-checkin flatpickr">
										<i class="far fa-calendar-alt"></i> <input id="SelectDate"
											placeholder="Ngày Nhận phòng" value="">

									</div>
									<div class="input-date-wrap input-date-checkout flatpickr">
										<i class="far fa-calendar-alt"></i> <input id="SelectDate"
											placeholder="Ngày Trả phòng" value="">
									</div>
								</div>
								<div style="width: 100%;" class="content-input-people-room">
									<div class="input-people-room-text">
										<i class="fa-solid fa-users"></i>
										<div class="input-people-text">
											<div class="input-people">
												<span class="adultNum">1</span> người lớn, <span
													class="childNum">0</span> trẻ em
											</div>

											<div class="input-room"><span class="roomNum">1</span> phòng</div>
										</div>

										<i class="fa-solid fa-chevron-down point-down"></i>
									</div>

									<div class="input-add-room-people">
										<div class="input-add add-room">
											<div class="input-add-text">
												<div class="add-text-title">Phòng</div>
												<div class="add-text-desc"></div>
											</div>

											<div class="input-add-btn">
												<i class="fa-regular fa-square-minus minusRoom"></i>
												<span class="input-add-number rooms">1</span> 
												<i class="fa-solid fa-square-plus addRoom"></i>
											</div>
										</div>
										<div class="input-add add-adult">
											<div class="input-add-text">
												<div class="add-text-title">Người lớn</div>
												<div class="add-text-desc">18 tuổi trở lên</div>
											</div>

											<div class="input-add-btn input-add-btn-adult">
												<i id="minusAdult"
													class="fa-solid fa-square-minus minusAdult"></i> <span
													id="adults" class="input-add-number adults">1</span> <i
													id="addAdult" class="fa-regular fa-square-plus addAdult"></i>
											</div>
										</div>
										<div class="input-add add-child">
											<div class="input-add-text">
												<div class="add-text-title">Trẻ em</div>
												<div class="add-text-desc">0-12 tuổi</div>
											</div>

											<div class="input-add-btn">
												<i id="minusChild"
													class="fa-regular fa-square-minus minusChild"></i> <span
													class="input-add-number children">0</span> <i id="addChild"
													class="fa-solid fa-square-plus addChild"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="option_btn">
								<button class="room-btn padding-12 blue-outline-button">Thêm
									Vào Giỏ</button>
								<button class="room-btn blue-button  padding-12">Đặt
									ngay</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- Mở menu user -->
	<script>
		const app = document.querySelector('.app__header-user-display');
		const menuClick = document.querySelector('.app__header-user-menu');
		function user_menu_click() {
			// hideUserMenu();
			hideShowAddForm();
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
	<!-- Mở form thêm phòng, người -->
	<script>
		const AddFormClick = document
				.getElementsByClassName('input-people-room-text');
		const ShowAddForm = document
				.getElementsByClassName('input-add-room-people');
		function ShowAddRoomPeopleForm(e) {
			hideUserMenu();

			let test = e.target;
			while (!test.classList.contains('content-input-people-room')) {
				test = test.parentElement;
			}
			test.children[1].classList.toggle('show');

		}

		for (let i = 0; i < ShowAddForm.length; i++) {
			AddFormClick[i].addEventListener('click', ShowAddRoomPeopleForm);
			ShowAddForm[i].addEventListener('click', function() {
				event.stopPropagation();
			});
			AddFormClick[i].addEventListener('click', function() {
				event.stopPropagation();
			});
		}
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
		// function hideShowSearchForm() {
		//     for (let i = 0; i < ShowSearchForm.length; i++)
		//         ShowSearchForm[i].classList.remove('show');
		// }
		function autoHide() {
			hideUserMenu();
			hideShowAddForm();
			// hideShowSearchForm();
		}
	</script>
	<!-- 	<script -->
	<%-- 		src="<c:url value="https://unpkg.com/vue@3/dist/vue.global.js"/>"></script> --%>
	<script src="<c:url value="https://cdn.jsdelivr.net/npm/flatpickr"/>"></script>
	<script
		src="<c:url value="https://npmcdn.com/flatpickr/dist/l10n/vn.js"/>"></script>
	<script>
		flatpickr("#SelectDate", {
			minDate : "today",
			dateFormat : "d-m-Y",
			"locale" : "vn"
		});
	</script>
	<script src="<c:url value="./script/addRoomPeople.js"/>"></script>
	<script type="module" src="<c:url value="./script/countDays.js"/>"></script>
	<script type="module" src="<c:url value="./script/numbeWithComma.js"/>"></script>
	<script type="module" src="<c:url value="./script/cartHeader.js"/>"></script>











	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script> -->
	<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script> -->
	<!-- DropZone | Documentation: http://dropzonejs.com -->
	<!-- <script type="text/javascript" src="scripts/dropzone.js"></script> -->
	<!-- Vue JS -->
	<!-- <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script> -->


</body>
</html>