-- ============================================================
-- SCHEMA CHO PHẦN MỀM BÁN HÀNG QUÁN ĂN
-- Dán toàn bộ nội dung này vào Supabase > SQL Editor > New query > Run
-- ============================================================

create table if not exists settings (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz default now()
);

create table if not exists products (
  id text primary key,
  name text not null,
  price numeric not null default 0,
  unit text,
  category text,
  vat_rate numeric default 0,
  barcode text,
  active boolean default true,
  updated_at timestamptz default now()
);

create table if not exists orders (
  id text primary key,
  code text,
  created_at timestamptz default now(),
  items jsonb,
  subtotal numeric,
  vat_by_rate jsonb,
  vat_total numeric,
  discount numeric,
  total numeric,
  payment_method text,
  customer_name text,
  table_name text,
  status text default 'completed'
);

create table if not exists open_tickets (
  id text primary key,
  table_name text not null,
  items jsonb default '[]',
  discount numeric default 0,
  customer_name text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Bật realtime để nhiều thiết bị tự cập nhật cho nhau
alter publication supabase_realtime add table products;
alter publication supabase_realtime add table orders;
alter publication supabase_realtime add table settings;
alter publication supabase_realtime add table open_tickets;

-- Bật bảo mật cấp dòng (bắt buộc), sau đó mở quyền đọc/ghi
-- cho khoá "anon" (khoá công khai app dùng để kết nối).
-- Lưu ý: mức bảo mật này phù hợp cho quán quy mô nhỏ, dùng nội bộ.
-- Nếu cần bảo mật cao hơn (đăng nhập từng nhân viên), có thể nâng cấp
-- sang Supabase Auth sau.
alter table settings enable row level security;
alter table products enable row level security;
alter table orders enable row level security;
alter table open_tickets enable row level security;

create policy "allow all settings" on settings for all using (true) with check (true);
create policy "allow all products" on products for all using (true) with check (true);
create policy "allow all orders" on orders for all using (true) with check (true);
create policy "allow all open_tickets" on open_tickets for all using (true) with check (true);
