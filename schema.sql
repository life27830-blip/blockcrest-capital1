-- Starter schema only. Review with a qualified engineer before production use.
-- Run in a fresh Supabase project. This schema does not move or custody funds.

create extension if not exists pgcrypto;

create type public.account_status as enum ('pending', 'active', 'restricted', 'closed');
create type public.request_status as enum ('submitted', 'under_review', 'approved', 'rejected', 'completed', 'cancelled');
create type public.funding_method as enum ('crypto', 'card', 'bank_transfer');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  country_code char(2),
  account_status public.account_status not null default 'pending',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.investment_plans (
  id uuid primary key default gen_random_uuid(),
  name text not null unique check (name in ('Starter', 'Silver', 'Gold', 'Platinum')),
  description text not null default '',
  active boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.deposit_requests (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id),
  method public.funding_method not null,
  asset_or_currency text not null,
  amount numeric(24, 8) not null check (amount > 0),
  status public.request_status not null default 'submitted',
  provider_reference text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.withdrawal_requests (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id),
  method public.funding_method not null,
  asset_or_currency text not null,
  amount numeric(24, 8) not null check (amount > 0),
  destination_reference text,
  status public.request_status not null default 'submitted',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.referrals (
  id uuid primary key default gen_random_uuid(),
  referrer_user_id uuid not null references public.profiles(id),
  referred_user_id uuid references public.profiles(id),
  referral_code text not null unique,
  status text not null default 'created' check (status in ('created', 'registered', 'eligible', 'rejected')),
  created_at timestamptz not null default now(),
  unique (referrer_user_id, referred_user_id)
);

create table public.audit_events (
  id uuid primary key default gen_random_uuid(),
  actor_user_id uuid references public.profiles(id),
  event_type text not null,
  entity_type text not null,
  entity_id uuid,
  details jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

-- Enable row-level security on user-related data.
alter table public.profiles enable row level security;
alter table public.deposit_requests enable row level security;
alter table public.withdrawal_requests enable row level security;
alter table public.referrals enable row level security;
alter table public.audit_events enable row level security;
alter table public.investment_plans enable row level security;

create policy "Users can view their own profile"
  on public.profiles for select
  using (auth.uid() = id);

create policy "Users can update limited profile fields through server validation"
  on public.profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

create policy "Users can view their own deposit requests"
  on public.deposit_requests for select
  using (auth.uid() = user_id);

create policy "Users can submit their own deposit requests"
  on public.deposit_requests for insert
  with check (auth.uid() = user_id and status = 'submitted');

create policy "Users can view their own withdrawal requests"
  on public.withdrawal_requests for select
  using (auth.uid() = user_id);

create policy "Users can submit their own withdrawal requests"
  on public.withdrawal_requests for insert
  with check (auth.uid() = user_id and status = 'submitted');

create policy "Users can view referrals they own"
  on public.referrals for select
  using (auth.uid() = referrer_user_id);

create policy "Users can view active plans"
  on public.investment_plans for select
  using (active = true);

-- Audit events should be written by trusted server-side code only.
-- Do not add a client insert policy for audit_events.
-- Admin role/policies must be designed separately; do not rely on a client-supplied role.
