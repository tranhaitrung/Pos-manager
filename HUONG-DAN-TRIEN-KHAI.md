# Hướng dẫn triển khai Sổ Bán Hàng lên hệ thống thật

Làm theo đúng thứ tự bên dưới. Toàn bộ đều **miễn phí**, không cần biết lập trình.
Thời gian: khoảng 15–20 phút.

---

## Phần 1 — Tạo máy chủ dữ liệu dùng chung (Supabase)

1. Vào **https://supabase.com** → **Start your project** → đăng ký (email hoặc GitHub).
2. Bấm **New project**:
   - Đặt tên bất kỳ, ví dụ `quan-an-pos`
   - Đặt mật khẩu database (lưu lại, ít dùng đến)
   - Chọn khu vực gần Việt Nam nhất (Singapore)
   - Bấm **Create new project**, chờ ~2 phút để khởi tạo.
3. Vào menu bên trái → **SQL Editor** → **New query**.
4. Mở file **schema.sql** (đính kèm cùng gói này), copy toàn bộ nội dung, dán vào ô SQL Editor → bấm **Run**.
   - Nếu chạy thành công sẽ thấy "Success. No rows returned".
5. Vào menu bên trái → **Project Settings** (biểu tượng bánh răng) → **API**.
   - Copy **Project URL** (dạng `https://xxxxx.supabase.co`)
   - Copy khoá **anon public** (chuỗi dài bắt đầu `eyJ...`)
   - Giữ 2 thông tin này lại, sẽ dùng ở Phần 3.

> Đây là "database" dùng chung — mọi điện thoại kết nối vào đây sẽ thấy cùng một dữ liệu, cập nhật theo thời gian thực.

---

## Phần 2 — Đưa app lên mạng (Netlify)

1. Vào **https://app.netlify.com/drop**
2. Kéo thả file **pos-quan-an.html** vào khung "Drag and drop your site output folder here".
   - Netlify sẽ tự đổi tên thành `index.html` và cấp cho bạn 1 đường link dạng
     `https://ten-ngau-nhien.netlify.app`
3. (Khuyến khích) Bấm **Site settings** → **Change site name** để đặt tên dễ nhớ, ví dụ
   `quananco-ba.netlify.app`.
4. Đây chính là **link web thật** — gửi link này cho điện thoại thu ngân và chủ quán, ai cũng vào được, không cần cài đặt gì.

> Nếu bạn đã có domain riêng (ví dụ `banhang.quananco-ba.vn`), có thể trỏ domain đó vào site Netlify này trong mục **Domain settings**.

---

## Phần 3 — Kết nối app với máy chủ dữ liệu

1. Mở link Netlify vừa tạo trên điện thoại.
2. Lần đầu mở sẽ hiện màn hình **"Kết nối máy chủ dữ liệu"**.
3. Dán **Project URL** và **anon public key** đã lấy ở Phần 1 vào 2 ô tương ứng → bấm **Kết nối**.
4. Làm lại đúng bước này trên **từng điện thoại** sẽ dùng phần mềm (thu ngân, chủ quán...).
   Chỉ cần nhập 1 lần trên mỗi máy — lần sau mở lại sẽ tự kết nối.

Xong! Từ giờ mọi đơn hàng, sản phẩm, cấu hình trên các máy sẽ **tự động đồng bộ cho nhau theo thời gian thực**.

---

## Kiểm tra hoạt động

- Mở app trên 2 điện thoại cùng lúc, tạo 1 đơn hàng ở máy A → máy B sẽ tự cập nhật danh sách đơn hàng trong vài giây.
- Góc trên bên phải màn hình có chữ **"● Đã đồng bộ"** (xanh) nghĩa là kết nối tốt. Nếu chuyển đỏ **"● Mất kết nối"**, kiểm tra lại wifi/4G.

## Lưu ý về bảo mật & vận hành

- Gói Supabase miễn phí đủ dùng cho quán nhỏ/vừa (500MB dữ liệu, hàng chục nghìn đơn hàng).
- Bất kỳ ai có link web + hiểu thông tin kết nối đều có thể vào sửa dữ liệu — phù hợp dùng nội bộ. Nếu cần phân quyền theo từng nhân viên (đăng nhập riêng), báo lại để nâng cấp thêm.
- Nên xuất CSV định kỳ (trong mục Cấu hình / Đơn hàng) để lưu trữ dự phòng, phục vụ đối chiếu kế toán.
- Đơn hàng đã thanh toán không thể sửa/xoá, chỉ có thể huỷ — đảm bảo tính toàn vẹn dữ liệu kế toán.
