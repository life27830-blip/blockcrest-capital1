# BlockCrest Capital — website prototype

A responsive Next.js dashboard prototype for a digital-asset investment platform. It is deliberately marked as a **demo** and does not process payments, custody crypto, authenticate real users, calculate real returns, or represent a regulated financial service.

## What's included

- Responsive investor dashboard UI
- Starter, Silver, Gold, and Platinum plan cards
- Portfolio, activity, referrals, documents, and security navigation
- Deposit method concepts: crypto, bank card, and bank transfer
- Withdrawal and investment-plan preview modals
- Admin and backend implementation checklist
- Supabase SQL starter schema with row-level security policies

## Run locally

Requirements: Node.js 18.17+ and npm.

```bash
npm install
npm run dev
```

Open `http://localhost:3000`.

## Deploy a public preview

1. Create a GitHub repository and upload this project.
2. Import the repository into Vercel.
3. Use the default Next.js build settings and deploy.
4. The resulting Vercel URL can be public. A custom domain is optional and usually costs money.
5. Do not advertise the prototype as accepting investments. The dashboard currently uses static demo content.

## Supabase setup (not connected yet)

1. Create a Supabase project.
2. Run `supabase/schema.sql` in the SQL editor.
3. Copy `.env.example` to `.env.local` and add your Supabase project URL and public anon key.
4. Implement authentication and server-side data access before using personal information or account data.
5. Use a separate, server-only service-role secret only in trusted server code; never expose it in browser code.

## Before accepting real funds

This is not a production-ready investment platform. Do not accept customer funds until the legal, compliance, custody, accounting, operational, and security requirements have been reviewed and implemented. Requirements vary by jurisdiction and by the exact business model.

Required work includes:
- Legal review of licensing/registration obligations in each target jurisdiction.
- Identity verification, sanctions screening, AML controls, transaction monitoring, complaints handling, and record retention as applicable.
- A qualified custody and wallet architecture; never store customer private keys in browser code or a general-purpose app database.
- Payment-provider approval for the actual business model and countries served.
- Double-entry ledger, idempotent transaction processing, reconciliation, withdrawal controls, and audit logs.
- Admin MFA, least-privilege access, rate limits, monitoring, incident response, backups, and security testing.
- Clear, reviewed terms, privacy notices, risk disclosures, fee disclosures, and product eligibility rules.
- A verified market-data source and performance calculations tied to actual transactions and positions.
- Independent security review and end-to-end testing.

Investment plans are presented as service tiers only. Do not promise fixed or guaranteed returns, or show simulated profits as real user performance.
