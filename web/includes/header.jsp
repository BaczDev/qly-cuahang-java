
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QLY Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>
<header class="py-3 mb-4 border-bottom" style="background:#e5e5e5;">

    <div class="container d-flex flex-wrap align-items-center justify-content-between">

        <a href="index.jsp" class="d-flex align-items-center text-dark text-decoration-none">
            ABC Shop
        </a>

        <ul class="nav mb-2 justify-content-center mb-md-0">
            <li><a href="index.jsp" class="nav-link px-2 link-secondary">Trang chủ</a></li>
            <li><a href="products.jsp" class="nav-link px-2 link-dark">Sản phẩm</a></li>
            <li><a href="contact.jsp" class="nav-link px-2 link-dark">Liên hệ</a></li>
        </ul>

        <div class="text-end d-flex align-items-center">

            <a class="text-black me-3 text-decoration-none" href="cart.jsp">
                <i class="bi bi-cart-fill fs-5"></i>
            </a>

            <a class="text-black me-3 text-decoration-none" href="login.jsp">
                Đăng nhập
            </a>

            <a class="text-black text-decoration-none" href="register.jsp">
                Đăng ký
            </a>

        </div>

    </div>

</header>
  
<main class="container my-4">
