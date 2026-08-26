-- ============================================================
-- CẬP NHẬT THÊM: Nhiều hoá đơn / bàn (ngồi ghép) + cấu hình số bàn
-- Dán đoạn này vào Supabase > SQL Editor > New query > Run
-- (Chỉ cần chạy nếu trước đó đã chạy migration-ban.sql rồi)
-- ============================================================

alter table open_tickets add column if not exists seq integer default 1;
