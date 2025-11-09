<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="includes/header.jsp" %>

<%
    // Fake product
    String name = "Ghế Sofa Cao Cấp";
    String image = "https://picsum.photos/500/400?random=1";
    double price = 4990000;
    String description = "Ghế sofa cao cấp với chất liệu da tổng hợp, khung gỗ tự nhiên, thiết kế hiện đại phù hợp mọi không gian.";

    // Fake reviews
    class Review {

        String user;
        int rating;
        String comment;

        Review(String u, int r, String c) {
            user = u;
            rating = r;
            comment = c;
        }
    }

    List<Review> reviews = new ArrayList<>();
    reviews.add(new Review("Nguyễn Văn A", 5, "Sản phẩm rất đẹp, ngồi êm và chắc chắn."));
    reviews.add(new Review("Trần Thị B", 4, "Giao nhanh, chất lượng tốt."));
    reviews.add(new Review("Phạm Minh C", 3, "Ổn, nhưng màu hơi khác so với ảnh."));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%= name%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Ẩn mũi tên mặc định của input[type=number] */
            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[type=number] {
                -moz-appearance: textfield; /* Firefox */
            }
        </style>

    </head>

    <body class="bg-light">

        <div class="container mt-0 mb-5">

            <!-- Chi tiết sản phẩm -->
            <div class="row bg-white p-4 rounded shadow-sm">

                <!-- Ảnh -->
                <div class="col-md-5">
                    <img src="<%= image%>" class="img-fluid rounded" alt="product">
                </div>

                <!-- Thông tin -->
                <div class="col-md-7">
                    <h2 class="fw-bold mb-3"><%= name%></h2>

                    <%
                        java.text.NumberFormat vnFormat = java.text.NumberFormat.getInstance(new java.util.Locale("vi", "VN"));
                        String formattedPrice = vnFormat.format(price);
                    %>

                    <h4 class="text-danger mb-3"><%= formattedPrice%> VNĐ</h4>


                    <p class="mb-4"><%= description%></p>

                    <!-- FORM thêm vào giỏ hàng -->
                    <form action="add-to-cart" method="post" class="mt-3">

                        <!-- fake ID -->
                        <input type="hidden" name="productId" value="1">

                        <label class="fw-semibold mb-2">Số lượng:</label>

                        <div class="d-flex align-items-center mb-4" style="width: 170px;">
                            <button type="button" class="btn btn-outline-secondary" onclick="changeQty(-1)">−</button>

                            <input id="qty" name="quantity" type="number"
                                   class="form-control text-center mx-2"
                                   value="1" min="1">

                            <button type="button" class="btn btn-outline-secondary" onclick="changeQty(1)">+</button>
                        </div>

                        <button class="btn btn-dark px-4 py-2">Thêm vào giỏ hàng</button>

                    </form>

                </div>

            </div>

            <!-- Đánh giá -->
            <div class="mt-5 bg-white p-4 rounded shadow-sm">
                <h4 class="fw-bold mb-4">Đánh giá của người dùng</h4>

                <%
                    for (Review r : reviews) {
                %>
                <div class="border-bottom pb-3 mb-3">
                    <strong><%= r.user%></strong>
                    <span class="text-warning ms-2">★ <%= r.rating%>/5</span>
                    <p class="mt-2"><%= r.comment%></p>
                </div>
                <%
                    }
                %>
            </div>

        </div>

        <!-- Script tăng giảm số lượng -->
        <script>
            function changeQty(delta) {
                const qtyInput = document.getElementById("qty");
                let value = parseInt(qtyInput.value) + delta;
                if (value < 1)
                    value = 1;
                qtyInput.value = value;
            }
        </script>

    </body>
</html>

<%@ include file="includes/footer.jsp" %>
