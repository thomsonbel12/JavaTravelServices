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
	href="<c:url value="/assets/css/CartDetail.css"/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->



<style>
input {
	/* width: 100%; */
	height: 100%;
	border: none;
	outline: none;
}

input:hover {
	background-color: rgb(236, 236, 236);
}
</style>
</head>
<body>

    <div id="app" class="app__CartDetail">
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
							????ng nh???p
							<!-- </a> -->
						</button>
					</div>

					<div class="app__header-signin">
						<button onclick="location.href='/ProjectTravelServices/signup'"
							class="app__header-button">
							<!-- <a href="dangKi.html" class="app_header-login--link"> -->
							T???o t??i kho???n
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
					<a class="rgbRed_OutlineButton button-padding_12">????ng k?? cho
						thu?? nh??</a> <span class="shopping_cart"> <a
						class="rgbRed-text" href="/ProjectTravelServices/cartdetail"> <i
							class="fa-solid fa-cart-shopping"> <span
								class="cart-item-number total_cart_room total_cart_room"></span>
						</i>
					</a>
						<div class="shopping_cart-items">
							<div class="cart-text">Danh s??ch c???a t??i</div>

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
													<label style="color: #333;">Ng??y nh???n ph??ng</label>
													<div class="cart-day">${y.getCheckIn_date()}</div>
												</div>
												<div class="cart-item-people">
													<div style="color: #333;">1 ph??ng</div>
													<div>${y.getAdult()} ng?????i l???n, ${y.getChildren()} tr??? em</div>
												</div>
												<div class="cart-item-money">
													${y.getPrice_room()} &nbsp;<span>VN??</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="cart-item cart-item-detail-link">
								<p>
									C?? <span class="rgbRed-text fontWeight-700 total_cart_room"></span>
									ph??ng trong danh s??ch
								</p>
								<a class="rgbRed_OutlineButton button-padding_12"
									href="/ProjectTravelServices/cartdetail">Chi ti???t danh s??ch</a>
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
						<div class="user-menu-text">T??I KHO???N C???A T??I</div>
						<div class="user-menu-option">
							<ul>
								<li><i class="fa-solid fa-list"></i> <!-- <a href="">????n ?????t ch??? c???a t??i</a> -->
									????n ?????t ch??? c???a t??i</li>

								<li><i class="fa-solid fa-envelope"></i> <!-- <a href="">H???p th??</a> -->
									H???p th??</li>

								<li><i class="fa-solid fa-heart"></i> <!-- <a href="">H??? s?? c???a t??i</a> -->
									Danh s??ch y??u th??ch</li>

								<li onclick="location.href='/ProjectTravelServices/myprofile'"><i
									class="fa-solid fa-address-card"></i> H??? s?? c???a t??i</li>

								<span> ?????c bi???t </span>

								<li class="landlord-register"><i
									class="fa-solid fa-house-flag"></i> ????ng k?? cho thu?? nh??</li>
								<button class="user-menu-option-logout"
									onclick="location.href='logout'">
									<i class="fa-solid fa-right-from-bracket"></i> ????ng xu???t
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
                    <li class="left-menu-item left-menu-cart-list">
                        <a href="/ProjectTravelServices/cartdetail">
                            <i class="fa-sharp fa-solid fa-clipboard"></i>
                            Gi??? h??ng c???a t??i
                        </a>
                    </li>
                    <li class="left-menu-item left-menu-history-list">
                        <a href="">
                            <i class="fa-solid fa-clipboard-check"></i>
                            L???ch s??? du l???ch
                        </a>
                    </li>
                    <li class="left-menu-item">
                        <a href="">
                            <i class="fa-solid fa-star"></i>
                            Danh s??ch y??u th??ch
                        </a>
                    </li>
                    <li class="left-menu-item left-menu-profile">
                        <a href="/ProjectTravelServices/myprofile">
                            <i class="fa-solid fa-address-card"></i>
                            H??? s?? c???a t??i
                        </a>
                    </li>
                </ul>

            </div>
            <div class="app__body-right-content">
                <div class="right-content-header">
                    <div class="header-banner">
                        <img src="https://cdn6.agoda.net/images/LOY-5878/default/vip-banner-agoji-non-vip.svg" alt="">
                        <div class="header-banner-text">
                            <span class="fontWeight-700">
                                B???n c?? mu???n tr??? th??nh kh??ch VIP kh??ng ?
                            </span>
                            <br>
                            <br>
                            <span style="font-size: 16px">
                                H??y ho??n t???t vi???c ?????t ph??ng v?? thanh to??n ????ng h???n ????? m??? kh??a c??c d???ch v??? v?? gi???m gi??,
                                v?? h?????ng d???ch v??? ?????c bi???t.
                            </span>
                        </div>
                        <img src="https://cdn6.agoda.net/images/LOY-5878/default/vip-banner-agoji-non-vip.svg" alt="">

                        <!-- <img  src="../assets/img/banner_1.png" alt=""> -->

                    </div>
                    <div class="header-option">
                        <div class="header-option-item header-option-left">
                            <!-- <div>Ph??ng</div> -->
                            <div
                                style="display: flex; align-items: center; width: 100%; justify-content: space-around;">
                                <input style="margin-right: 0;" type="checkbox" id="checkbox-selectAll"
                                    class="app__body-input-remember-checkbox checkbox-selectAll">
                                <label style="position: relative;" class="checkbox-all-text rgbRed-text"
                                    for="checkbox-selectAll">Ch???n t???t c???</label>
                            </div>

                        </div>
                        <div class="header-option-item header-option-right">
                            <div class="option-right-text rgbRed-text">S???p x???p theo</div>
                            <div class="option-right-btn option-right-checkin">Ng??y Nh???n ph??ng</div>
                            <div class="option-right-btn option-right-checkout">Ng??y Tr??? ph??ng</div>
                        </div>
                    </div>
                </div>

                <div class="right-content-body">
                    <form action="book" method="post">
                        <div style="width: 100%;" class="cart-list padding-8">
							<c:forEach items="${sessionScope.listCarts}" var="y">
                            <div class="cart-room-wrap">
                                <div style="padding-left: 12px;" class="cart-room-check">
                                    <input style="margin: unset;" type="checkbox" id="checkbox-select" name="${y.getCart_id()}"
                                        class="checkbox-select app__body-input-remember-checkbox">
                                </div>
                                <div class="cart-room padding-8">
                                    <div class="cart-room-img">
                                        <img src="${y.getImage()}"
                                            alt="">
                                    </div>
                                    <div class="cart-room-content">
                                        <div style="max-height: 43%;" class="cart-room-name rgbRed-text fontWeight-700">
                                            ${y.getType()} - ${y.getName_hotel()}
                                        </div>
                                        <div>
                                            <h2>
                                                S??? kh??ch: <span class="max_adult_num">${y.getMax_Adult()}</span>
                                                ng?????i l???n, <span class="max_child_num">${y.getMax_Children()}</span>
                                                tr??? em
                                            </h2>
                                            <h2>
                                                S??? ph??ng c??n tr???ng: <span class="max_available_num">${y.getAvailable_Room()}</span>
                                            </h2>
                                        </div>
                                        <div class="cart-room-decs">
                                            <div class="cart-room-date">
                                                <div style="width: 100%;" class="content-input-date-select">
                                                    <div class="input-date-wrap input-date-checkin flatpickr">
                                                        <i class="far fa-calendar-alt"></i>
                                                        <input id="SelectDate" class="checkin_date"
                                                            placeholder="Ng??y Nh???n ph??ng" value="${y.getCheckIn_date()}">

                                                    </div>
                                                    <div class="input-date-wrap input-date-checkout flatpickr">
                                                        <i class="far fa-calendar-alt"></i>
                                                        <input id="SelectDate" class="checkout_date"
                                                            placeholder="Ng??y Tr??? ph??ng" value="${y.getCheckOut_date()}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="cart-room-people">
                                                <div style="width: 100%;" class="content-input-people-room">
                                                    <div class="input-people-room-text">
                                                        <i class="fa-solid fa-users"></i>
                                                        <div class="input-people-text">
                                                            <div class="input-people">
                                                                <span class="adultNum">${y.getAdult()} </span> ng?????i l???n, <span
                                                                    class="childNum">${y.getChildren()}</span> tr??? em
                                                            </div>

                                                            <div class="input-room"><span class="roomNum">${y.getTotal_rooms()}</span> ph??ng</div>
                                                        </div>

                                                        <i class="fa-solid fa-chevron-down point-down"></i>
                                                    </div>

                                                    <div class="input-add-room-people">
                                                        <div class="input-add add-room">
                                                            <div class="input-add-text">
                                                                <div class="add-text-title">Ph??ng</div>
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
                                                                <div class="add-text-title">Ng?????i l???n</div>
                                                                <div class="add-text-desc">18 tu???i tr??? l??n</div>
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
                                                                <div class="add-text-title">Tr??? em</div>
                                                                <div class="add-text-desc">0-12 tu???i</div>
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
                                        </div>
                                    </div>
                                    <div class="cart-room-money">
                                        <div class="money-1day-wrap">
                                            <div class="cart-room-money-tag fontWeight-700 rgbRed-text">
                                                Gi?? Ti???n ( <span class="rgbRed-text"> 1 </span> Ng??y )
                                            </div>
                                            <div class="cart-room-money-price fontWeight-700 rgbRed-text">
                                                <div class="cart-room-money-text padding-8">
                                                    <span class="money-1-day">${y.getPrice_room()}</span>
                                                    <span class="semiBlack-text">&nbsp;VN??</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="total-days-wrap">
                                            <div class="fontWeight-700 rgbRed-text">T???ng s??? ng??y</div>
                                            <div class="fontWeight-700 rgbRed-text">
                                                <span class="total_days"></span>
                                                <span class="semiBlack-text fontWeight-600">Ng??y</span>
                                            </div>
                                        </div>

                                        <div class="total-room-money">
                                            <div class="fontWeight-700 rgbRed-text">T???ng s??? Ti???n</div>
                                            <div class="fontWeight-700 rgbRed-text">
                                                <span class="room-total-money-text"></span>
                                                <span class="semiBlack-text fontWeight-600">VND</span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="cart-room-btn padding-8">
                                        <a href="deletecart?cartID=${y.getCart_id()}" class="rgbRed_OutlineButton padding-8">
                                            <i class="fa-solid fa-trash"></i>
                                            X??a ph??ng n??y
                                        </a>
                                    </div>

                                </div>
                            </div>
							</c:forEach>

                        </div>

                        <div id="right-content-footer" class="right-content-footer">
                            <div class="footer-content-item footer-content-left">
                                <div class="footer-content-left-option">
                                    <div
                                        style="display: flex; align-items: center; width: 100%; justify-content: space-around;">
                                        <input style="margin-right: 0;" type="checkbox" id="checkbox-selectAll1"
                                            class="app__body-input-remember-checkbox checkbox-selectAll">
                                        <label style="position: relative;" class="checkbox-all-text rgbRed-text"
                                            for="checkbox-selectAll1">Ch???n t???t c???</label>
                                    </div>
                                </div>
                            </div>

                            <div class="border-bar"></div>
                            <div class="footer-content-item footer-content-center">
                                C?? t???t c??? &nbsp;<span class="rgbRed-text" id="cart-selected-num"> 0 </span>&nbsp; ph??ng
                                ???? ???????c
                                ch???n
                            </div>
                            <div class="border-bar"></div>

                            <div class="footer-content-item footer-content-right">
                                <div class="Money-Wrapper">

                                    <div class="Money-Tag">
                                        <span>T???ng Ti???n</span>
                                    </div>
                                    <div class="footer-all-money">
                                        <span id="footer-all-money-text"
                                            class="footer-all-money-text total_money rgbRed-text">0</span>
                                        <span class="footer-all-money-currency">VN??</span>
                                    </div>
                                </div>

                                <div class="footer-btn">
                                    <div  id="footer-btn-error" class="footer-btn-error padding-12"></div>
                                    <button type="submit" class="blue-button padding-8" id="submit-cart-checkout">
                                        <i class="fa-solid fa-money-check-dollar"></i>
                                        ?????t Ngay
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div id="no-cart-list" class="no-cart-list">
                        <img src="https://cdn6.agoda.net/images/MMB-3149/illustration-empty.png" alt="">
                        <div class="no-cart-text">
                            <p class="fontWeight-700">
                                Qu?? kh??ch kh??ng c?? ph??ng n??o trong danh s??ch ch???.</p>
                            <p style="font-size: 14px">
                                H??y th??m ph??ng v??o gi??? h??ng n???u qu?? kh??ch c?? ?? ?????nh xem x??t ?????t nhi???u ph??ng!
                            </p>
                            <a href="/ProjectTravelServices/home">
                                Quay tr??? v??? trang ch???
                            </a>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
    <script type="module" src="<c:url value="/script/addRoomPeople.js"/>"></script>
    <!-- M??? menu user -->
    <script>
        const app = document.querySelector('.app__header-user-display');
        const menuClick = document.querySelector('.app__header-user-menu');
        function user_menu_click() {
            hideShowAddForm();
            menuClick.classList.toggle("show");
        }

        app.addEventListener('click', user_menu_click);
        menuClick.addEventListener('click', function () {
            event.stopPropagation();
        });
        app.addEventListener('click', function () {
            event.stopPropagation();
        });

    </script>

    <!-- testt -->
    

    <!-- M??? form th??m ph??ng, ng?????i -->
    <script>
        const AddFormClick = document.getElementsByClassName('input-people-room-text');
        const ShowAddForm = document.getElementsByClassName('input-add-room-people');
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
            ShowAddForm[i].addEventListener('click', function () {
                event.stopPropagation();
            });
            AddFormClick[i].addEventListener('click', function () {
                event.stopPropagation();
            });
        }

    </script>

    <script>
        document.onclick = function () {
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
        function autoHide() {
            hideUserMenu();
            hideShowAddForm();
        }
    </script>

    <script>
        const dayCheckinSort = document.querySelector('.option-right-checkin');
        const dayCheckoutSort = document.querySelector('.option-right-checkout');

        function disableBtn() {
            dayCheckinSort.style.backgroundColor = "transparent";
            dayCheckoutSort.style.backgroundColor = "transparent";

            dayCheckinSort.style.fontWeight = "unset";
            dayCheckoutSort.style.fontWeight = "unset";
        }

        dayCheckinSort.addEventListener('click', function () {
            disableBtn();
            dayCheckinSort.style.backgroundColor = "#ddd";
            dayCheckinSort.style.fontWeight = "600";
        });

        dayCheckoutSort.addEventListener('click', function () {
            disableBtn();
            dayCheckoutSort.style.backgroundColor = "#ddd";
            dayCheckoutSort.style.fontWeight = "600";
        })
    </script>

    <script type="module" src="<c:url value="/script/numbeWithComma.js"/>"></script>
    <script type="module" src="<c:url value="/script/countDays.js"/>"></script>
    <script type="module" src="<c:url value="/script/dateHandle.js"/>"></script>
    <script type="module" src="<c:url value="/script/cartHeader.js"/>"></script>
    <script type="module" src="<c:url value="/script/cartSelect.js"/>"></script>
	<script type="module" src="<c:url value="/script/countDays.js"/>"></script>

    <!-- Script calendar flatpickr -->
    <script src="<c:url value="https://cdn.jsdelivr.net/npm/flatpickr"/>"></script>
    <script src="<c:url value="https://npmcdn.com/flatpickr/dist/l10n/vn.js"/>"></script>
    <script>
        flatpickr("#SelectDate", {
            minDate: "today",
            dateFormat: "d-m-Y",
            "locale": "vn"
        });
    </script>
    
    
    
</body>
</html>