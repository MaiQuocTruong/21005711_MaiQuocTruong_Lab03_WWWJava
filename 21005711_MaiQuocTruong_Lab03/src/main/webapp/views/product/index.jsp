<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Product Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css"
        integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Poppins', sans-serif;
            color: #333;
            margin: 20px;
        }
        .container {
            margin-top: 20px;
        }
        .product-card {
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            margin-bottom: 20px;
            cursor: pointer;
        }
        .product-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .product-image {
            width: 100%;
            object-fit: cover;
            height: 350px;
        }
        .product-details {
            padding: 15px;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }
        .product-price {
            color: #28a745;
            font-size: 16px;
            margin-bottom: 10px;
        }
        .btn-buy {
            background-color: #007bff;
            color: #fff;
            border-radius: 20px;
            padding: 8px 16px;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        .btn-buy:hover {
            background-color: #0056b3;
        }
        .extra-links {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="text-center mb-4">List of Products</h3>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4">
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/resources/images/${product.image}" class="product-image" alt="${product.name}">
                        <div class="product-details">
                            <div class="product-name">${product.name}</div>
                            <div class="product-price">$${product.price}</div>
                            <div class="text-center mt-2">
                                <a href="${pageContext.request.contextPath}/cart?action=buy&id=${product.id}" class="btn btn-buy">Buy</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- Liên kết đến các trang khác -->
        <div class="extra-links">
            <br/>
            <a href="registration-form.jsp">Go to Bai1</a>
            <br/>
            <a href="${pageContext.request.contextPath}/register">Go to Bai2 Page</a>
            <br/>
            <a href="login.jsp">Go to Bai3</a>
        </div>
    </div>
</body>
</html>
