# Sổ Bán Hàng — POS Quán Ăn

Phần mềm bán hàng cho quán ăn: bán hàng bằng điện thoại (POS di động), quét mã QR/vạch,
thống kê đơn hàng, cấu hình sản phẩm/thuế VAT linh động, xuất dữ liệu CSV cho kế toán.

## Kiến trúc

- **Giao diện**: 1 file `index.html` tĩnh (HTML/CSS/JS thuần), host trên GitHub Pages.
- **Dữ liệu dùng chung nhiều thiết bị**: [Supabase](https://supabase.com) (Postgres + realtime),
  cấu hình bảng theo `schema.sql`.
- Không cần backend riêng, không cần build — mở thẳng file là chạy.

## Triển khai

1. Tạo project Supabase, chạy `schema.sql` trong SQL Editor.
2. Trang này được GitHub Pages tự động phục vụ tại:
   `https://<username>.github.io/<repo>/`
3. Mở link trên điện thoại → lần đầu nhập Project URL + anon key của Supabase để kết nối.

Xem hướng dẫn chi tiết trong `HUONG-DAN-TRIEN-KHAI.md`.
