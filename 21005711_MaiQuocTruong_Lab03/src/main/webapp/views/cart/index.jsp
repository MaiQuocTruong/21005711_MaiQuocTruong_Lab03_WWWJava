<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Cart Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css"
        integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
            color: #333;
            padding: 20px;
        }
        .container {
            margin-top: 30px;
        }
        .table {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .table thead {
            background-color: #007bff;
            color: #ffffff;
        }
        .btn-remove {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-remove:hover {
            background-color: #c82333;
        }
        .btn-continue, .btn-checkout {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 15.5px 30px;
            border-radius: 5px;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
            margin: 10px;
            font-size: 16px;
            height: 50px;
            line-height: 20px;
        }
        .btn-continue:hover, .btn-checkout:hover {
            background-color: #218838;
        }
        .product-image {
            width: 100px;
            height: auto;
        }
        .total-row {
            font-weight: bold;
            font-size: 1.2rem;
        }
    </style>
    
    <script>
            function confirmCheckout(total) {
                     const confirmation = confirm("Bạn có muốn thanh toán không? Tổng số tiền là $" + total);
                 if (confirmation) {
                 // Nếu người dùng chọn "Có", chuyển hướng tới action checkout
                 window.location.href = '${pageContext.request.contextPath}/cart?action=checkout&total=' + total;
                 } else {
                 // Nếu người dùng chọn "Không", không làm gì cả
                 alert("Thanh toán đã được hủy.");
                 }
            }
    </script>
    
</head>
<body>
    <div class="container">
        <h3 class="text-center mb-4">Shopping Cart</h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Option</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Photo</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Sub Total</th>
                    </tr>
                </thead>
                <c:set var="total" value="0"></c:set>
                <c:forEach var="item" items="${sessionScope.cart}">
                    <c:set var="total" value="${total + item.product.price * item.quantity}"></c:set>
                    <tr>
                        <td align="center">
                            <button class="btn-remove" onclick="if(confirm('Are you sure you want to remove this item?')) { window.location.href = '${pageContext.request.contextPath}/cart?action=remove&id=${item.product.id}'; }">Remove</button>
                        </td>
                        <td>${item.product.id}</td>
                        <td>${item.product.name}</td>
                        <td><img src="${pageContext.request.contextPath}/resources/images/${item.product.image}" class="product-image" alt="${item.product.name}"></td>
                        <td>$${item.product.price}</td>
                        <td>${item.quantity}</td>
                        <td>$${item.product.price * item.quantity}</td>
                    </tr>
                </c:forEach>
                <tr class="total-row">
                    <td colspan="6" align="right">Total</td>
                    <td>$${total}</td>
                </tr>
            </table>
        </div>

        <div class="text-center">
            <a href="${pageContext.request.contextPath}/product" class="btn-continue">Continue Shopping</a>
            <%-- <a href="${pageContext.request.contextPath}/cart?action=checkout" class="btn-checkout">Checkout</a> --%>
            <a href="javascript:void(0);" onclick="confirmCheckout(${total});" class="btn-checkout">Checkout</a>   
        </div>
    </div>
</body>
</html>
