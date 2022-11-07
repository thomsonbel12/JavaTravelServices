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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>


<body>

	<div id="app" class="app__main">
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
													<div>${y.getAdult()}ngườilớn,${y.getChildren()} trẻ
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
			<div class="search-container">
				<div class="search-container-text">
					<h2>TÌM TỔ ẤM VỚI LHT C.</h2>
					<p>Rộng rãi hơn, chân thực hơn, nhiều lý do để đi du lịch hơn.
					</p>

					<div style="display: none">
						<h2>
							Số khách: <span class="max_adult_num">100</span> người lớn, <span
								class="max_child_num">100</span> trẻ em
						</h2>
						<h2>
							Số phòng còn trống: <span class="max_available_num">100</span>
						</h2>
					</div>
				</div>

				<div class="search-container-all">
					<div class="search-container-list">
						<ul>
							<li id="hotel-category"
								class="search-category search-container-select-hotel"><i
								class="fa-solid fa-hotel"></i> <span>Khách sạn & Nhà</span></li>
							<li id="house-category"
								class="search-category search-container-select-house"><i
								class="fa-solid fa-house-flag"></i> <span>Chỗ ở riêng</span></li>
							<li id="xxx0-category"
								class="search-category search-container-select-xxx0"><i
								class="fa-solid fa-wrench"></i> <span>Cập nhật sau</span></li>
							<li id="xxx1-category"
								class="search-category search-container-select-xxx1"><i
								class="fa-solid fa-wrench"></i> <span>Cập nhật sau</span></li>
							<li id="xxx2-category"
								class="search-category search-container-select-xxx2"><i
								class="fa-solid fa-wrench"></i> <span>Cập nhật sau</span></li>
							<li id="xxx3-category"
								class="search-category search-container-select-xxx3"><i
								class="fa-solid fa-wrench"></i> <span>Cập nhật sau</span></li>
						</ul>
					</div>

					<div class="search-container-content">
						<form class="search-content-item" action="search" method="post">
							<div id="item-category-hotel"
								class="content-item-category content-item-category-hotel">
								<button
									class="content-item-button blue-button button-padding_12">
									Chỗ ở qua đêm</button>
								<button
									class="content-item-button blue-outline-button button-padding_12">
									Chỗ ở trong ngày</button>

								<div class="content-item-input-text">
									<!-- <i class="fa-light fa-magnifying-glass"></i> -->
									<label for="place-input"> <i
										class="fa-solid fa-magnifying-glass"></i>
									</label> <input name="search_input" id="place-input" type="text"
										placeholder="Nhập địa điểm du lịch hoặc tên Khách sạn">
									<div class="item-input-search-wrap">
										<div class="item-input-search-list">
											<ul>
												<li class="search-list-item">

													<div>
														<i class="fa-solid fa-location-dot"></i>
													</div>
													<div class="search-list-item-text">
														<p class="search-item-place">Hồ Chí Minh</p>
														<p class="search-item-desc">Thành Phố</p>
													</div>
												</li>
												<li class="search-list-item">
													<div>
														<i class="fa-sharp fa-solid fa-bed"></i>
													</div>
													<div class="search-list-item-text">
														<p class="search-item-place">Hotel Plaza 5 sao</p>
														<p class="search-item-desc">Khách Sạn</p>
													</div>
												</li>
												<li class="search-list-item">
													<div>
														<i class="fa-solid fa-location-dot"></i>
													</div>
													<div class="search-list-item-text">
														<p class="search-item-place">Hồ Chí Minh</p>
														<p class="search-item-desc">Thành Phố</p>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="content-input-selection">
									<div class="content-input-date-select">
										<div class="input-date-wrap input-date-checkin">
											<i class="far fa-calendar-alt"></i> <input id="SelectDate"
												placeholder="Ngày Nhận phòng">

										</div>
										<div class="input-date-wrap input-date-checkout">
											<i class="far fa-calendar-alt"></i> <input id="SelectDate"
												placeholder="Ngày Trả phòng">
										</div>

									</div>
									<div class="content-input-people-room">
										<div class="input-people-room-text">
											<i class="fa-solid fa-users"></i>
											<div class="input-people-text">
												<div class="input-people">
													<span class="adultNum">1</span> người lớn, <span
														class="childNum">0</span> trẻ em
												</div>

												<div class="input-room">
													<span class="roomNum">1</span> phòng
												</div>
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
													<i class="fa-regular fa-square-minus minusRoom"></i> <span
														class="input-add-number rooms">1</span> <i
														class="fa-solid fa-square-plus addRoom"></i>
												</div>
											</div>
											<div class="input-add add-adult">
												<div class="input-add-text">
													<div class="add-text-title">Người lớn</div>
													<div class="add-text-desc">18 tuổi trở lên</div>
												</div>

												<div class="input-add-btn">
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
														class="input-add-number children">0</span> <i
														id="addChild" class="fa-solid fa-square-plus addChild"></i>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="content-discount-wrap">
									<div class="content-discount-tag">
										<p>Đặt gói tiết kiệm</p>
									</div>
									<div class="discount-input">
										<!-- <i class="fa-light fa-magnifying-glass"></i> -->
										<label for="discount-input-text"> <i
											class="fa-solid fa-magnifying-glass"></i>
										</label> <input id="discount-input-text" type="text"
											placeholder="Nhập hoặc chọn khuyến mãi">
									</div>
								</div>

							</div>

							<div id="item-category-house"
								class="content-item-category content-item-category-house">
								<button
									class="content-item-button blue-button button-padding_12">
									Chỗ ở qua đêm</button>
								<button
									class="content-item-button blue-outline-button button-padding_12">
									Chỗ ở trong ngày</button>
								<div id="house-text">
									<img height="20" width="20" alt="dayuse-icon"
										src="//cdn6.agoda.net/images/esc-web/dayuse-icon.svg">
									<p>
										<span> Chỗ ở riêng </span> <span> là nơi ở lâu dài, từ
										</span> <span> 1 - 2 tháng trở lên. </span> <span> Phù hợp với
											những khách hàng có nhu cầu đi du lịch, công tác trong thời
											gian dài mà muồn tiết kiệm chi phí. </span>
									</p>
								</div>
								<div class="content-item-input-text">
									<i class="fa-light fa-magnifying-glass"></i> <label
										for="place-input"> <i
										class="fa-solid fa-magnifying-glass"></i>
									</label> <input id="place-input" type="text"
										placeholder="Nhập địa điểm du lịch hoặc tên Khách sạn">
									<div class="item-input-search-wrap">
										<div class="item-input-search-list">
											<ul>
												<li class="search-list-item">

													<div>
														<i class="fa-solid fa-location-dot"></i>
													</div>
													<div class="search-list-item-text">
														<p class="search-item-place">Hồ Chí Minh</p>
														<p class="search-item-desc">Thành Phố</p>
													</div>
												</li>
												<li class="search-list-item">
													<div>
														<i class="fa-sharp fa-solid fa-bed"></i>
													</div>
													<div class="search-list-item-text">
														<p class="search-item-place">Hotel Plaza 5 sao</p>
														<p class="search-item-desc">Khách Sạn</p>
													</div>
												</li>
												<li class="search-list-item">
													<div>
														<i class="fa-solid fa-location-dot"></i>
													</div>
													<div class="search-list-item-text">
														<p class="search-item-place">Hồ Chí Minh</p>
														<p class="search-item-desc">Thành Phố</p>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="content-input-selection">
									<div class="content-input-date-select">
										<div class="input-date-wrap input-date-checkin">
											<i class="far fa-calendar-alt"></i> <input id="SelectDate"
												placeholder="Ngày Nhận phòng">

										</div>
										<div class="input-date-wrap input-date-checkout">
											<i class="far fa-calendar-alt"></i> <input id="SelectDate"
												placeholder="Ngày Trả phòng">
										</div>

									</div>
									<div class="content-input-people-room">
										<div class="input-people-room-text">
											<i class="fa-solid fa-users"></i>
											<div class="input-people-text">
												<div class="input-people">
													<span class="adultNum">1</span> người lớn, <span
														class="childNum">0</span> trẻ em
												</div>

												<div class="input-room">
													<span class="roomNum">1</span> phòng
												</div>
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
													<i class="fa-regular fa-square-minus minusRoom"></i> <span
														class="input-add-number rooms">1</span> <i
														class="fa-solid fa-square-plus addRoom"></i>
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
														class="input-add-number children">0</span> <i
														id="addChild" class="fa-solid fa-square-plus addChild"></i>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="content-discount-wrap">
									<div class="content-discount-tag">
										<p>Đặt gói tiết kiệm</p>
									</div>
									<div class="discount-input">
										<i class="fa-light fa-magnifying-glass"></i> <label
											for="discount-input-text"> <i
											class="fa-solid fa-magnifying-glass"></i>
										</label> <input id="discount-input-text" type="text"
											placeholder="Nhập hoặc chọn khuyến mãi">
									</div>
								</div>

							</div>

							<c:if test="${sessionScope.error_search!=null}">
								<div>
									<h3 class="error_search"
										style="color: red; text-align: center;">${sessionScope.error_search}</h3>
								</div>
							</c:if>

							<div class="content-item-search-button">
								<button class="search-button blue-button"
									onclick="location.href='search'" type="submit">TÌM</button>
							</div>
						</form>
					</div>


				</div>
			</div>



			<div id="body" class="flex-container">
				<div id="show-text">
					Những địa điểm nổi tiếng ở <span> Việt Nam </span> mà bạn nên thử
					ghé thăm
				</div>
				<div class="selectedCity">
					<ul class="ListCity">
						<li class="city_select" id="hcm"
							<%-- ${tag == "hcm" ? 'style="border-bottom: 2px solid #5392fa"' : '' } --%>
							onclick="Loadcity('hcm')">TP.
							Hồ Chí Minh</li>
						<li class="city_select" id="hn"
							<%-- ${tag == "hn" ? 'style="border-bottom: 2px solid #5392fa"' : '' } --%>
							onclick="Loadcity('hn')">Hà
							Nội</li>
						<li class="city_select" id="vt"
							<%-- ${tag == "vt" ? 'style="border-bottom: 2px solid #5392fa"' : '' } --%>
							onclick="Loadcity('vt')">Vũng
							Tàu</li>
						<li class="city_select" id="dn"
							<%-- ${tag == "dn" ? 'style="border-bottom: 2px solid #5392fa"' : '' } --%>
							onclick="Loadcity('dn')">Đà
							Nẵng</li>
						<li class="city_select" id="dl"
							<%-- ${tag == "dl" ? 'style="border-bottom: 2px solid #5392fa"' : '' } --%>
							onclick="Loadcity('dl')">Đà
							Lạt</li>
					</ul>
				</div>
				<div id="content" style="display: flex;"></div>
				<%-- <c:forEach items="${listHotels}" var="o">
					<div class="box-hotel" id="box-list">
						<a href="room?hotelID=${o.getHotel_id()}" class="address-price">
							<img class="imgBox" style="cursor: pointer; min-height: 260px; display: flex; flex-direction: column; justify-content: space-between; padding: 12px; border-radius: 10px;" src="${o.getImage()}">
							<p class="nameBox">
								<b> ${o.getName_Hotel()}</b>
							</p>
							<p class="addressBox">
								<b> ${o.getAddress()}</b>
							</p>
							<p class="priceBox">
								<b> ${o.getPrice()} VNĐ</b>
							</p>
						</a>
					</div>
				</c:forEach>
 --%>
			</div>
		</div>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		const select_city = document.getElementsByClassName("city_select")
		// console.log(select_city[0])
		function city_click(e) {
			let ct = e.target;
			for (let i = 0; i < select_city.length; i++) {
				select_city[i].style.borderBottom = "1px solid #aaa"
			}
			// console.log(ct)
			ct.style.borderBottom = "2px solid #5392fa"
		}
		for (let i = 0; i < select_city.length; i++) {
			// console.log(select_city[i])
			select_city[i].addEventListener('click', city_click)
		}
		function Loadcity(Cityid) {
			$
					.ajax({
						url : "/ProjectTravelServices/city",
						type : "get",
						data : {
							cid : Cityid
						},
						success : function(responseData) {
							document.getElementById("content").innerHTML = responseData;
						}
					});
		}
		Loadcity("hcm")
	</script>

	<!-- Mở menu user -->
	<script>
		const app = document.querySelector('.app__header-user-display');
		const menuClick = document.querySelector('.app__header-user-menu');
		function user_menu_click() {
			// hideUserMenu();
			hideShowAddForm();
			hideShowSearchForm();
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

	<!-- search-category search-container-select CLICK -->
	<script>
		function hideBottomBorderSearchList() {
			document.getElementById("item-category-hotel").style.display = "none";
			document.getElementById("item-category-hotel").style.opacity = "0";
			document.getElementById("hotel-category").style.borderBottom = "none";
			document.getElementById("hotel-category").style.color = "rgb(126, 126, 126)";

			document.getElementById("item-category-house").style.display = "none";
			document.getElementById("item-category-house").style.opacity = "0";
			document.getElementById("house-category").style.borderBottom = "none";
			document.getElementById("house-category").style.color = "rgb(126, 126, 126)";

			document.getElementById("xxx0-category").style.borderBottom = "none";
			document.getElementById("xxx0-category").style.color = "rgb(126, 126, 126)";

			document.getElementById("xxx1-category").style.borderBottom = "none";
			document.getElementById("xxx1-category").style.color = "rgb(126, 126, 126)";

			document.getElementById("xxx2-category").style.borderBottom = "none";
			document.getElementById("xxx2-category").style.color = "rgb(126, 126, 126)";

			document.getElementById("xxx3-category").style.borderBottom = "none";
			document.getElementById("xxx3-category").style.color = "rgb(126, 126, 126)";
		}

		//------------------------------------------------ 
		function hotelCategoryClick() {
			hideBottomBorderSearchList();
			document.getElementById("item-category-hotel").style.display = "block";
			document.getElementById("item-category-hotel").style.opacity = "1";
			document.getElementById("hotel-category").style.borderBottom = "3px solid #5392fa";
			document.getElementById("hotel-category").style.color = "#5392fa";

		}
		document.getElementById("hotel-category").addEventListener('click',
				hotelCategoryClick);

		//------------------------------------------------ 
		function houseCategoryClick() {
			hideBottomBorderSearchList();
			document.getElementById("item-category-house").style.display = "block";
			document.getElementById("item-category-house").style.opacity = "1";
			document.getElementById("house-category").style.borderBottom = "3px solid #5392fa";
			document.getElementById("house-category").style.color = "#5392fa";
		}
		document.getElementById("house-category").addEventListener('click',
				houseCategoryClick);

		//------------------------------------------------ 
		function xxx0CategoryClick() {
			hideBottomBorderSearchList();
			document.getElementById("xxx0-category").style.borderBottom = "3px solid #5392fa";
			document.getElementById("xxx0-category").style.color = "#5392fa";
		}
		document.getElementById("xxx0-category").addEventListener('click',
				xxx0CategoryClick);

		//------------------------------------------------ 
		function xxx1CategoryClick() {
			hideBottomBorderSearchList();
			document.getElementById("xxx1-category").style.borderBottom = "3px solid #5392fa";
			document.getElementById("xxx1-category").style.color = "#5392fa";
		}
		document.getElementById("xxx1-category").addEventListener('click',
				xxx1CategoryClick);

		//------------------------------------------------ 
		function xxx2CategoryClick() {
			hideBottomBorderSearchList();
			document.getElementById("xxx2-category").style.borderBottom = "3px solid #5392fa";
			document.getElementById("xxx2-category").style.color = "#5392fa";
		}
		document.getElementById("xxx2-category").addEventListener('click',
				xxx2CategoryClick);

		//------------------------------------------------ 
		function xxx3CategoryClick() {
			hideBottomBorderSearchList();
			document.getElementById("xxx3-category").style.borderBottom = "3px solid #5392fa";
			document.getElementById('xxx3-category').style.color = "#5392fa";
		}
		document.getElementById("xxx3-category").addEventListener('click',
				xxx3CategoryClick);

		//-----------------------------------------------
	</script>

	<!-- Mở danh sách tìm kiếm khách sạn, địa chỉ -->
	<script>
		const searchFormClick = document
				.querySelectorAll('.content-item-input-text');
		const ShowSearchForm = document
				.querySelectorAll('.item-input-search-wrap');
		function ShowSearchList() {
			hideUserMenu();
			hideShowAddForm();
			// hideShowDatePick();

			for (let i = 0; i < ShowSearchForm.length; i++)
				ShowSearchForm[i].classList.toggle('show');
		}
		for (let i = 0; i < ShowSearchForm.length; i++) {
			searchFormClick[i].addEventListener('click', ShowSearchList);
			ShowSearchForm[i].addEventListener('click', function() {
				event.stopPropagation();
			});
			searchFormClick[i].addEventListener('click', function() {
				event.stopPropagation();
			});
		}
	</script>
	<!-- Mở form thêm phòng, người -->
	<script>
		const AddFormClick = document
				.querySelectorAll('.input-people-room-text');
		const ShowAddForm = document.querySelectorAll('.input-add-room-people');
		function ShowAddRoomPeopleForm() {
			hideUserMenu();
			// hideShowAddForm();
			hideShowSearchForm();
			// hideShowDatePick();

			for (let i = 0; i < ShowAddForm.length; i++)
				ShowAddForm[i].classList.toggle('show');
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
	<!-- Script calendar flatpickr -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/vn.js"></script>
	<script>
		flatpickr("#SelectDate", {
			"locale" : "vn",
			minDate : "today",
			dateFormat : "d-m-Y",

		});
	</script>



	<!-- <script>
        const datepickClick = document.querySelectorAll('.content-input-selection')
        const calendarShow = document.querySelectorAll('.calendar-wrap')
        function ShowCalendar(){
            hideUserMenu();
            hideShowAddForm();
            hideShowSearchForm();
            for(let i = 0; i < calendarShow.length; i++)
                calendarShow[i].classList.toggle('show')
        }
        for (let i = 0; i < calendarShow.length; i++) {
            datepickClick[i].addEventListener('click', ShowCalendar);
            calendarShow[i].addEventListener('click', function () {
                event.stopPropagation();
            });
            datepickClick[i].addEventListener('click', function () {
                event.stopPropagation();
            });
        }
    </script> -->

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
		function hideShowSearchForm() {
			for (let i = 0; i < ShowSearchForm.length; i++)
				ShowSearchForm[i].classList.remove('show');
		}
		// function hideShowDatePick(){
		//     for (let i = 0; i < calendarShow.length; i++)
		//         calendarShow[i].classList.remove('show');
		// }
		function autoHide() {
			hideUserMenu();
			hideShowAddForm();
			hideShowSearchForm();
			// hideShowDatePick();
		}
	</script>


	<script src="<c:url value="./script/addRoomPeople.js"/>"></script>
	<script type="module" src="<c:url value="./script/countDays.js"/>"></script>
	<script type="module" src="<c:url value="./script/numbeWithComma.js"/>"></script>
	<script type="module" src="<c:url value="./script/cartHeader.js"/>"></script>



</body>
</html>