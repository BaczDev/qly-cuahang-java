<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>
<%@ page import="java.util.*" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .equal-col {
        display: flex;
    }
    .equal-card {
        flex: 1;
        display: flex;
        flex-direction: column;
    }
    /* ✅ Màu chấm tròn (indicator) đen */
.carousel-indicators [data-bs-target] {
    background-color: black !important;
}

/* ✅ Khi chấm tròn active → đen luôn */
.carousel-indicators .active {
    background-color: black !important;
}

/* ✅ Mũi tên chuyển slide (prev/next) màu đen */
.carousel-control-prev-icon,
.carousel-control-next-icon {
    filter: invert(1) brightness(0%) !important; 
}

/* ✅ Tăng độ đậm cho mũi tên */
.carousel-control-prev-icon,
.carousel-control-next-icon {
    width: 2rem;
    height: 2rem;
}
</style>

<%
    List<String> categories = Arrays.asList(
        "Card mạng","Gateway","Load Balancer","Modem","Network Security Appliance",
        "PoE Injector/Switch","Repeater/Range Extender","Router","Switch","Wireless Access Point"
    );

    List<Map<String, String>> products = Arrays.asList(
        Map.of("name", "Router Wi-Fi AX6000", "price", "2.500.000đ", "img", "assets/img/router.jpg", "id", "101"),
        Map.of("name", "Switch PoE 8 cổng Gigabit", "price", "1.850.000đ", "img", "assets/img/switch.jpg", "id", "102"),
        Map.of("name", "Wireless Access Point AC1200", "price", "890.000đ", "img", "assets/img/ap.jpg", "id", "103"),
        Map.of("name", "Modem Cáp quang GPON", "price", "600.000đ", "img", "assets/img/modem.jpg", "id", "104"),
        Map.of("name", "Load Balancer cấp doanh nghiệp", "price", "15.000.000đ", "img", "assets/img/lb.jpg", "id", "105"),
        Map.of("name", "Card mạng 10 Gigabit", "price", "3.200.000đ", "img", "assets/img/nic.jpg", "id", "106")
    );
%>
<!-- ✅ BANNER CAROUSEL -->
<div id="homeBanner" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">

    <!-- ✅ Chấm tròn điều hướng -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#homeBanner" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#homeBanner" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#homeBanner" data-bs-slide-to="2"></button>
    </div>

    <!-- ✅ Hình banner -->
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img src="https://chuyendoiquang.com/pub/media/catalog/category/bannerthietbimang.jpg" class="d-block w-100" style="height:350px; object-fit:cover;">
        </div>

        <div class="carousel-item">
            <img src="https://vuhoangtelecom.vn/wp-content/uploads/2025/05/thiet-bi-mang-tp-link.jpg" class="d-block w-100" style="height:350px; object-fit:cover;">
        </div>

        <div class="carousel-item">
            <img src="https://vienthongtba.com/public/upload/category/banner-thiet-bi-mang-0cLkAEeewO.jpg" class="d-block w-100" style="height:350px; object-fit:cover;">
        </div>

    </div>

    <!-- ✅ Nút chuyển slide -->
    <button class="carousel-control-prev" type="button" data-bs-target="#homeBanner" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#homeBanner" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>

</div>


<div class="container my-4">

    <!-- ✅ Tiêu đề tách ra, KHÔNG nằm trong col bên phải -->
    <h3 class="mb-4 text-center text-uppercase text-primary">
        Danh sách sản phẩm
    </h3>

    <!-- ✅ Hai cột bằng nhau chính xác -->
    <div class="row align-items-stretch">

        <!-- ✅ CỘT TRÁI -->
        <aside class="col-md-3 mb-4 equal-col">
            <div class="card shadow-sm equal-card">
                <div class="card-header bg-primary text-white fw-bold">
                    Danh mục thiết bị mạng
                </div>

                <ul class="list-group list-group-flush">
                    <% for (int i = 0; i < categories.size(); i++) {
                        String name = categories.get(i);
                        String slug = name.toLowerCase().replaceAll("[^a-z0-9]+", "-");
                    %>
                        <li class="list-group-item">
                            <a href="category.jsp?slug=<%= slug %>&id=<%= i+1 %>" 
                               class="text-decoration-none text-dark">
                                <%= name %>
                            </a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </aside>

        <!-- ✅ CỘT PHẢI (chỉ chứa grid sản phẩm) -->
        <section class="col-md-9 equal-col">
            <div class="equal-card">

                <div class="row">
                    <% for (Map<String,String> p : products) { %>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm">

                            <img src="<%= p.get("img") %>"
                                 class="card-img-top"
                                 style="height:200px;object-fit:contain;padding:10px;">

                            <div class="card-body d-flex flex-column">
                                <h5 class="text-truncate"><%= p.get("name") %></h5>

                                <p class="text-danger fw-bold mt-auto"><%= p.get("price") %></p>

                                <a href="product-detail.jsp?id=<%= p.get("id") %>"
                                   class="btn btn-primary w-100">
                                    Xem chi tiết
                                </a>
                            </div>

                        </div>
                    </div>
                    <% } %>
                </div>

            </div>
        </section>

    </div>
</div>

<%@ include file="includes/footer.jsp" %>
