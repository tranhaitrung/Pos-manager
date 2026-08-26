-- ============================================================
-- CẬP NHẬT THÊM: Tính năng quản lý theo bàn
-- Dán đoạn này vào Supabase > SQL Editor > New query > Run
-- (Chỉ cần chạy 1 lần, không ảnh hưởng dữ liệu cũ)
-- ============================================================

-- Thêm cột tên bàn vào bảng đơn hàng đã có
alter table orders add column if not exists table_name text;

-- Bảng lưu các bàn đang phục vụ (chưa thanh toán)
create table if not exists open_tickets (
  id text primary key,
  table_name text not null,
  items jsonb default '[]',
  discount numeric default 0,
  customer_name text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter publication supabase_realtime add table open_tickets;

alter table open_tickets enable row level security;
create policy "allow all open_tickets" on open_tickets for all using (true) with check (true);
