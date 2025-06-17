<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../assets/cart.css">
    <title>장바구니</title>
	<%
		String id = (String)session.getAttribute("log_id");
	%>

</head>
<body>
    <header class="header-container">
     <%@include file="./header.jsp" %>
      </header>
    <div id="wrap">
    <div class="header">
        <div class="steps">
            <div class="step">1</div>
            <span>장바구니</span>
            <div class="step">2</div>
            <span>사은품선택</span>
            <div class="step">3</div>
            <span>주문/결제</span>
            <div class="step">4</div>
            <span>주문완료</span>
        </div>
    </div>
    <div class="section_main">
        <form method="post" id="subForm">

    <div class="menu">
        <a href="#" onclick="confirmClick(event)">
            <img src="./../assets/images/ico_delete_black@2x.png" id="delete_img">선택삭제
        </a>
        <a href="#" onclick="confirmClickID(event)">전체삭제</a>
    </div>

    <div class="container">
        <div class="product-list">
        <%
            CartDAO dao = CartDAO.getInstance();
            List<BookDTO> cartList = dao.cartSel(id);
            for (BookDTO bookDTO : cartList) {
                int discountedPrice = bookDTO.getPrice() - bookDTO.getPrice() / 10;
        %>
            <div class="product-item">
                <input type="checkbox" class="product-checkbox">
                <img src="<%=bookDTO.getImage()%>" alt="<%=bookDTO.getTitle()%>" class="product-img">
                <div class="product-info">
                    <p class="product-title"><%=bookDTO.getTitle()%></p>
                    <p class="product-price">
                        <span class="discount">10%</span>
                        <strong><%=discountedPrice%></strong>
                        <del><%=bookDTO.getPrice()%></del>
                        <%=(int)(bookDTO.getPrice()*0.03)%>P
                    </p>
                </div>
                <div class="product-actions">
                    <span class="final-price"><%=discountedPrice%></span>
                    <div class="quantity-control">
                        <button class="qty-btn" type="button">-</button>
                        <span class="qty">1</span>
                        <button class="qty-btn" type="button">+</button>
                    </div>
                    <div class="shipping-info">
                        <a href="#" class="address-link">배송지 등록 필요 ></a>
                        <button class="btn-quick" type="button">바로드림</button>
                        <p class="pickup-info">1시간 이후 수령 가능</p>
                    </div>
                    <button class="delete-btn" type="button" onclick="confirmClick(event)">✕</button>
                </div>

                <input type="hidden" name="book_id" value="<%=bookDTO.getBook_id()%>">
                <input type="hidden" name="qty" class="qty-input" value="1">
                <input type="hidden" name="resultPrice" class="price-input" value="<%=discountedPrice%>">
            </div>
        <%
            }
        %>
        </div>
            <!-- 플레이스홀더 -->
            <div class="placeholder"></div>
        </div>
        <div class="summary">
            <div class="summary-item"><span>상품 금액</span><span>0원</span></div>
			<div class="summary-item"><span>배송비</span><span>+ 0원</span></div>
			<div class="summary-item"><span>상품 할인</span><span>- 0원</span></div>
			<hr>
			<div class="summary-item" id="summary-item"><span>결제 예정 금액</span><span>0원</span></div>
			<div class="summary-item"><span>적립 예정 포인트</span><span id="point-summary">0P</span></div>
            <a href="#" class="order-btn" onclick="confirmClickIns(event)">주문하기</a>
        </div>
        </form>
    </div>
    </div>
<footer class="header-container">
   <%@include file="./footer.jsp" %>
  </footer>
  <script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
  const productItems = document.querySelectorAll(".product-item");
  const checkboxes = document.querySelectorAll(".product-checkbox");

  const updateSummary = () => {
    let totalPrice = 0;
    let totalDiscount = 0;
    let totalPoint = 0;
    let totalQty = 0;

    productItems.forEach(p => {
      const checkbox = p.querySelector(".product-checkbox");
      if (!checkbox.checked) return;

      const qty = parseInt(p.querySelector(".qty").textContent);
      const originalPrice = parseInt(p.querySelector(".product-price del").textContent.replace(/,/g, ""));
      const discountedPrice = parseInt(p.querySelector(".product-price strong").textContent.replace(/,/g, ""));

      totalPrice += originalPrice * qty;
      totalDiscount += (originalPrice / 10) * qty;
      totalPoint += Math.floor(originalPrice * 0.03) * qty;
      totalQty += qty;
    });

    document.querySelector(".summary-item:nth-child(1) span:last-child").textContent = totalPrice.toLocaleString() + "원";
    document.querySelector(".summary-item:nth-child(3) span:last-child").textContent = "- " + totalDiscount.toLocaleString() + "원";
    document.querySelector("#summary-item span:last-child").textContent = (totalPrice - totalDiscount).toLocaleString() + "원";
    document.getElementById("point-summary").textContent = totalPoint.toLocaleString() + "P";

    const orderBtn = document.querySelector(".order-btn");
    if (orderBtn) {
      orderBtn.innerText = `주문하기`;
    }
  };

  productItems.forEach(item => {
    const minusBtn = item.querySelector(".qty-btn:first-of-type");
    const plusBtn = item.querySelector(".qty-btn:last-of-type");
    const qtySpan = item.querySelector(".qty");
    const priceEl = item.querySelector(".product-price strong");
    const finalPriceEl = item.querySelector(".final-price");

    const qtyInput = item.querySelector(".qty-input");
    const priceInput = item.querySelector(".price-input");

    const changeQty = (delta) => {
      let qty = parseInt(qtySpan.textContent);
      qty = Math.max(1, qty + delta);
      qtySpan.textContent = qty;

      const discountedPrice = parseInt(priceEl.textContent.replace(/,/g, ""));
      finalPriceEl.textContent = (discountedPrice * qty).toLocaleString();

      qtyInput.value = qty;
      priceInput.value = discountedPrice * qty;

      updateSummary();
    };

    minusBtn.addEventListener("click", () => changeQty(-1));
    plusBtn.addEventListener("click", () => changeQty(1));
  });

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener("change", updateSummary);
  });

  updateSummary();
});

// 선택삭제
function confirmClick(event) {
	  event.preventDefault();
	  const form = document.getElementById("subForm");
	  const productItems = document.querySelectorAll(".product-item");
	  const id = "<%=id%>";
	  if (id.trim() === "" || id === "null") {
		  alert("로그인이 필요한 서비스입니다");
		  window.location.href = "login.jsp"
		  return;
		}
	  let hasChecked = false;

	  productItems.forEach(item => {
	    const checkbox = item.querySelector(".product-checkbox");
	    const bookInput = item.querySelector("input[name='book_id']");
	    const qtyInput = item.querySelector(".qty-input");
	    const priceInput = item.querySelector(".price-input");

	    if (checkbox.checked) {
	      hasChecked = true;
	      bookInput.disabled = false;
	      qtyInput.disabled = false;
	      priceInput.disabled = false;
	    } else {
	      bookInput.disabled = true;
	      qtyInput.disabled = true;
	      priceInput.disabled = true;
	    }
	  });

	  if (!hasChecked) {
	    alert("삭제할 항목을 선택하세요.");
	    return;
	  }

	  form.action = "cartDel.jsp";
	  form.submit();
	}

// 전체삭제
function confirmClickID(event) {
  event.preventDefault();
  const id = "<%=id%>";
  if (id.trim() === "" || id === "null") {
	  alert("로그인이 필요한 서비스입니다");
	  window.location.href = "login.jsp"
	  return;
	}
  if (confirm("모든 항목을 삭제하시겠습니까?")) {
    window.location.href = "cartDel.jsp?all=true";
  }
}

// 주문하기
function confirmClickIns(event) {
  event.preventDefault();
  const id = "<%=id%>";
  const form = document.getElementById("subForm");
  const productItems = document.querySelectorAll(".product-item");
  if (id.trim() === "" || id === "null") {
	  alert("로그인이 필요한 서비스입니다");
	  window.location.href = "login.jsp"
	  return;
	}
  let hasChecked = false;

  productItems.forEach(item => {
    const checkbox = item.querySelector(".product-checkbox");
    const qtyInput = item.querySelector(".qty-input");
    const priceInput = item.querySelector(".price-input");
    const bookInput = item.querySelector("input[name='book_id']");

    if (checkbox.checked) {
      hasChecked = true;
      qtyInput.disabled = false;
      priceInput.disabled = false;
      bookInput.disabled = false;
    } else {
      qtyInput.disabled = true;
      priceInput.disabled = true;
      bookInput.disabled = true;
    }
  });

  if (!hasChecked) {
    alert("구매할 항목을 선택하세요.");
    return;
  }

  form.action = "cartIns.jsp";
  form.submit();
}
</script>

</body>
</html>