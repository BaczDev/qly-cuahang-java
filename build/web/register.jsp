<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký tài khoản</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container py-4" style="margin-top:-35px;">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white text-center">
                            <h4 class="mb-0">Đăng ký tài khoản</h4>
                        </div>
                        <div class="card-body">
                            <form action="register" method="post" novalidate>

                                <div class="mb-3">
                                    <label class="form-label">Tên đăng nhập</label>
                                    <input type="text" name="username" class="form-control" required>
                                    <span id="errUsername" class="text-danger small"></span>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" required>
                                    <span id="errEmail" class="text-danger small"></span>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="text" name="phone" class="form-control" required>
                                    <span id="errPhone" class="text-danger small"></span>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Địa chỉ</label>
                                    <input type="text" name="address" class="form-control" required>
                                    <span id="errAddress" class="text-danger small"></span>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mật khẩu</label>
                                    <input type="password" name="password" class="form-control" required>
                                    <span id="errPassword" class="text-danger small"></span>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Nhập lại mật khẩu</label>
                                    <input type="password" name="confirmPassword" class="form-control" required>
                                    <span id="errConfirmPassword" class="text-danger small"></span>
                                </div>

                                <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                                <div class="text-center mt-3">
                                    <span class="text-muted">Bạn đã có tài khoản?</span>
                                    <a href="login.jsp" class="ms-1 fw-semibold" style="text-decoration:none;">
                                        Đăng nhập
                                    </a>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
        // Lấy form và tất cả input
            const form = document.querySelector("form");
            const inputs = form.querySelectorAll("input");

        // Hàm hiển thị lỗi
            function showErr(input, msg) {
                let span = document.getElementById("err" + input.name.charAt(0).toUpperCase() + input.name.slice(1));
                input.classList.add("is-invalid");
                if (span)
                    span.textContent = msg;
            }

        // Xóa lỗi
            function clearErr(input) {
                let span = document.getElementById("err" + input.name.charAt(0).toUpperCase() + input.name.slice(1));
                input.classList.remove("is-invalid");
                if (span)
                    span.textContent = "";
            }

        // Validate từng trường
            function validateField(input) {
                let v = input.value.trim();
                clearErr(input);

                if (input.name === "username" && v.length < 4)
                    showErr(input, "Tên đăng nhập >= 4 ký tự");

                if (input.name === "email" && v.indexOf("@") === -1)
                    showErr(input, "Email không hợp lệ");

                if (input.name === "phone" && v.length !== 10)
                    showErr(input, "SĐT phải 10 số");

                if (input.name === "address" && v === "")
                    showErr(input, "Không được để trống");

                if (input.name === "password" && v.length < 6)
                    showErr(input, "Mật khẩu >= 6 ký tự");

                if (input.name === "confirmPassword" && v !== form.password.value)
                    showErr(input, "Không khớp mật khẩu");
            }

        // Chỉ validate khi blur (bỏ focus)
            inputs.forEach(i => {
                i.addEventListener("blur", () => validateField(i));
            });

        // Validate khi submit toàn form
            form.addEventListener("submit", function (e) {
                let ok = true;

                inputs.forEach(i => {
                    validateField(i);
                    if (i.classList.contains("is-invalid"))
                        ok = false;
                });

                if (!ok)
                    e.preventDefault();
            });
        </script>

    </body>
</html>

<%@ include file="includes/footer.jsp" %>
