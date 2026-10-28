"use client";

import { useState } from "react";
import {
  Activity, ArrowDownLeft, ArrowUpRight, Bell, Bitcoin, ChevronDown,
  CircleHelp, Clock3, CreditCard, Download, Eye, EyeOff, FileText,
  Globe2, LayoutDashboard, LifeBuoy, LockKeyhole, LogOut, Menu,
  Plus, ShieldCheck, TrendingUp, Users, Wallet, X
} from "lucide-react";

type Plan = { name: string; summary: string; risk: string; color: string };

const plans: Plan[] = [
  { name: "Starter", summary: "Explore digital-asset investing with a small allocation.", risk: "Risk varies by asset and market conditions.", color: "mint" },
  { name: "Silver", summary: "A broader allocation view for developing portfolios.", risk: "Market losses are possible.", color: "silver" },
  { name: "Gold", summary: "Portfolio tools for users managing a larger allocation.", risk: "Higher exposure can mean larger losses.", color: "gold" },
  { name: "Platinum", summary: "An advanced portfolio overview and reporting tier.", risk: "No return is guaranteed.", color: "platinum" }
];

const transactions = [
  { label: "Account setup", detail: "Demo activity · No funds moved", date: "Today", amount: "—", status: "Demo" },
  { label: "Portfolio created", detail: "Sample portfolio record", date: "Today", amount: "—", status: "Demo" },
  { label: "Identity review", detail: "Verification not connected", date: "Pending setup", amount: "—", status: "Not active" }
];

export default function Home() {
  const [active, setActive] = useState("Overview");
  const [showBalance, setShowBalance] = useState(true);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [modal, setModal] = useState<"deposit" | "withdraw" | "invest" | "help" | null>(null);
  const [notice, setNotice] = useState("");
  const nav = [
    { label: "Overview", icon: LayoutDashboard },
    { label: "My portfolio", icon: Wallet },
    { label: "Investment plans", icon: TrendingUp },
    { label: "Transactions", icon: Activity },
    { label: "Referrals", icon: Users },
    { label: "Documents", icon: FileText },
    { label: "Security", icon: ShieldCheck }
  ];

  function openModal(kind: "deposit" | "withdraw" | "invest" | "help") {
    setNotice("");
    setModal(kind);
  }

  function handleDemoSubmit() {
    setNotice("Demo only: no money has moved and no investment has been created. Payment, identity checks, and account services must be configured before launch.");
  }

  return (
    <main className="app-shell">
      <aside className={`sidebar ${mobileOpen ? "sidebar-open" : ""}`}>
        <div className="brand">
          <div className="brand-mark"><Bitcoin size={23} strokeWidth={2.2} /></div>
          <div><strong>BlockCrest</strong><span>CAPITAL</span></div>
          <button className="close-mobile" onClick={() => setMobileOpen(false)} aria-label="Close menu"><X size={19}/></button>
        </div>
        <div className="workspace-label">WORKSPACE</div>
        <nav className="nav-list">
          {nav.map(({label, icon: Icon}) => (
            <button key={label} onClick={() => { setActive(label); setMobileOpen(false); }} className={`nav-item ${active === label ? "selected" : ""}`}>
              <Icon size={18} /><span>{label}</span>{label === "Security" && <span className="nav-dot"/>}
            </button>
          ))}
        </nav>
        <div className="sidebar-bottom">
          <div className="support-card"><div className="support-icon"><LifeBuoy size={18}/></div><strong>Need a hand?</strong><p>Our support center will be available after setup.</p><button onClick={() => openModal("help")}>Visit support <ArrowUpRight size={14}/></button></div>
          <div className="sidebar-user"><div className="avatar">BC</div><div className="user-copy"><strong>Demo account</strong><span>Preview mode</span></div><ChevronDown size={16}/></div>
        </div>
      </aside>

      {mobileOpen && <button className="mobile-scrim" onClick={() => setMobileOpen(false)} aria-label="Close navigation"/>}

      <section className="main-area">
        <header className="topbar">
          <div className="top-left"><button className="menu-toggle" onClick={() => setMobileOpen(true)} aria-label="Open menu"><Menu size={20}/></button><span className="breadcrumb">Workspace <span>/</span> {active}</span></div>
          <div className="top-actions"><div className="market-status"><span className="live-dot"/><span>Market data not connected</span></div><button className="icon-button" aria-label="Notifications" onClick={() => setNotice("Notifications will appear here once account services are connected.")}><Bell size={18}/><i/></button><button className="help-button" onClick={() => openModal("help")}><CircleHelp size={17}/><span>Help</span></button></div>
        </header>

        <div className="page-content">
          <div className="welcome-row"><div><div className="eyebrow">WEDNESDAY, OCTOBER 28, 2026</div><h1>{active === "Overview" ? "Good afternoon." : active}</h1><p className="subheading">{active === "Overview" ? "Here’s your digital asset workspace at a glance." : `Manage your ${active.toLowerCase()} information in one place.`}</p></div><div className="welcome-actions"><button className="btn btn-secondary" onClick={() => openModal("withdraw")}><ArrowUpRight size={16}/> Withdraw</button><button className="btn btn-primary" onClick={() => openModal("deposit")}><Plus size={17}/> Add funds</button></div></div>

          <div className="demo-banner"><div className="banner-icon"><ShieldCheck size={18}/></div><div><strong>Preview environment</strong><span>This is a design prototype. Balances, activity, market data, deposits, withdrawals and returns are not live.</span></div><span className="demo-pill">DEMO</span></div>

          <div className="metric-grid">
            <article className="metric-card balance-card"><div className="metric-top"><span>Total account value</span><button className="eye-button" onClick={() => setShowBalance(!showBalance)} aria-label="Toggle balance visibility">{showBalance ? <Eye size={17}/> : <EyeOff size={17}/>}</button></div><div className="metric-value">{showBalance ? "$0.00" : "••••••"}</div><div className="metric-foot"><span className="neutral-tag"><Wallet size={13}/> Not connected</span><span>Live balance unavailable</span></div><div className="balance-graphic"><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/><div/></div></article>
            <article className="metric-card"><div className="metric-top"><span>Invested assets</span><span className="metric-icon green"><Bitcoin size={18}/></span></div><div className="metric-value">$0.00</div><div className="metric-foot"><span className="muted">No active positions</span></div></article>
            <article className="metric-card"><div className="metric-top"><span>Profit / loss</span><span className="metric-icon blue"><Activity size={18}/></span></div><div className="metric-value">$0.00</div><div className="metric-foot"><span className="muted">Actual performance not connected</span></div></article>
          </div>

          <div className="content-grid">
            <section className="panel portfolio-panel"><div className="panel-heading"><div><h2>Portfolio overview</h2><p>Asset allocation and account activity</p></div><button className="text-button" onClick={() => setActive("My portfolio")}>View portfolio <ArrowUpRight size={15}/></button></div><div className="empty-chart"><div className="chart-orbit orbit-one"/><div className="chart-orbit orbit-two"/><div className="chart-center"><div className="chart-center-icon"><Bitcoin size={26}/></div><strong>No portfolio data yet</strong><span>Connect your account to see verified balances.</span></div></div><div className="chart-legend"><span><i className="legend-dot dot-green"/>Bitcoin</span><span><i className="legend-dot dot-blue"/>Other assets</span><span><i className="legend-dot dot-gray"/>Cash</span><strong>—</strong></div></section>
            <section className="panel quick-panel"><div className="panel-heading"><div><h2>Quick actions</h2><p>Manage your account</p></div></div><div className="quick-actions"><button onClick={() => openModal("deposit")}><span className="quick-icon qi-green"><ArrowDownLeft size={18}/></span><span><strong>Deposit funds</strong><small>Crypto, card or bank transfer</small></span><ArrowUpRight className="quick-arrow" size={16}/></button><button onClick={() => openModal("withdraw")}><span className="quick-icon qi-blue"><ArrowUpRight size={18}/></span><span><strong>Withdraw funds</strong><small>Request a withdrawal</small></span><ArrowUpRight className="quick-arrow" size={16}/></button><button onClick={() => openModal("invest")}><span className="quick-icon qi-gold"><TrendingUp size={18}/></span><span><strong>Explore plans</strong><small>Compare investment options</small></span><ArrowUpRight className="quick-arrow" size={16}/></button><button onClick={() => setActive("Referrals")}><span className="quick-icon qi-purple"><Users size={18}/></span><span><strong>Invite a friend</strong><small>Referral tools not connected</small></span><ArrowUpRight className="quick-arrow" size={16}/></button></div></section>
          </div>

          <section className="panel plans-panel"><div className="panel-heading"><div><h2>Investment plans</h2><p>Choose a service tier to explore. Returns are not promised.</p></div><button className="text-button" onClick={() => setActive("Investment plans")}>All plans <ArrowUpRight size={15}/></button></div><div className="plans-grid">{plans.map((plan, i) => <article className={`plan-card ${i === 2 ? "featured-plan" : ""}`} key={plan.name}><div className={`plan-symbol ${plan.color}`}><TrendingUp size={18}/></div><div className="plan-name-row"><h3>{plan.name}</h3>{i === 2 && <span className="popular-label">POPULAR</span>}</div><p>{plan.summary}</p><div className="plan-divider"/><div className="plan-risk"><ShieldCheck size={14}/>{plan.risk}</div><button className={i === 2 ? "btn btn-primary plan-btn" : "btn btn-secondary plan-btn"} onClick={() => openModal("invest")}>Explore plan <ArrowUpRight size={15}/></button></article>)}</div></section>

          <section className="panel transactions-panel"><div className="panel-heading"><div><h2>Recent activity</h2><p>Illustrative records only; no transactions have occurred.</p></div><button className="text-button" onClick={() => setActive("Transactions")}>View history <ArrowUpRight size={15}/></button></div><div className="table-wrap"><table><thead><tr><th>ACTIVITY</th><th>DATE</th><th>AMOUNT</th><th>STATUS</th></tr></thead><tbody>{transactions.map((t) => <tr key={t.label}><td><div className="transaction-title"><span className="transaction-icon"><FileText size={16}/></span><span><strong>{t.label}</strong><small>{t.detail}</small></span></div></td><td className="date-cell">{t.date}</td><td className="amount-cell">{t.amount}</td><td><span className="status-pill">{t.status}</span></td></tr>)}</tbody></table></div></section>

          <footer className="footer"><span>© 2026 BlockCrest Capital · Prototype</span><div><button onClick={() => setNotice("Terms must be reviewed by qualified counsel before a public launch.")}>Terms</button><button onClick={() => setNotice("Privacy policy must be finalized before collecting personal data.")}>Privacy</button><button onClick={() => setNotice("Digital assets are volatile. You may lose some or all of your investment.")}>Risk disclosure</button></div></footer>
        </div>
      </section>

      {notice && <div className="toast" role="status"><ShieldCheck size={18}/><span>{notice}</span><button onClick={() => setNotice("")} aria-label="Dismiss"><X size={16}/></button></div>}

      {modal && <div className="modal-backdrop" onClick={() => setModal(null)}><section className="modal" onClick={e => e.stopPropagation()}><button className="modal-close" onClick={() => setModal(null)} aria-label="Close"><X size={19}/></button><div className="modal-symbol">{modal === "deposit" ? <ArrowDownLeft/> : modal === "withdraw" ? <ArrowUpRight/> : modal === "invest" ? <TrendingUp/> : <LifeBuoy/>}</div><div className="eyebrow">BLOCKCREST CAPITAL</div><h2>{modal === "deposit" ? "Add funds" : modal === "withdraw" ? "Request withdrawal" : modal === "invest" ? "Explore investment plans" : "Support center"}</h2><p className="modal-copy">{modal === "deposit" ? "Choose a funding method. Payments are not enabled in this preview." : modal === "withdraw" ? "Withdrawal requests will be available after secure account and payment integrations are configured." : modal === "invest" ? "Starter, Silver, Gold and Platinum are service-tier concepts. Investment terms and risks must be disclosed before activation." : "Support channels will be connected before the platform launches."}</p>
        {modal === "deposit" && <div className="method-list"><div><span className="method-icon"><Bitcoin size={19}/></span><span><strong>Cryptocurrency</strong><small>BTC and supported assets · not connected</small></span><LockKeyhole size={16}/></div><div><span className="method-icon"><CreditCard size={19}/></span><span><strong>Bank card</strong><small>Payment provider required</small></span><LockKeyhole size={16}/></div><div><span className="method-icon"><Globe2 size={19}/></span><span><strong>Bank transfer</strong><small>Availability depends on country and provider</small></span><LockKeyhole size={16}/></div></div>}
        {modal === "withdraw" && <div className="notice-box"><LockKeyhole size={17}/><span>Withdrawals are intentionally disabled until identity verification, custody controls, compliance checks, and payment rails are implemented.</span></div>}
        {modal === "invest" && <div className="modal-plan-list">{plans.map(p => <div key={p.name}><span className={`mini-plan ${p.color}`}/><strong>{p.name}</strong><span>{p.risk}</span></div>)}</div>}
        {modal === "help" && <div className="notice-box"><CircleHelp size={17}/><span>Support email, ticketing, and service hours need to be configured before launch.</span></div>}
        <button className="btn btn-primary modal-submit" onClick={handleDemoSubmit}>{modal === "help" ? "Check support setup" : "Continue in preview"} <ArrowUpRight size={16}/></button>{notice && <p className="modal-notice">{notice}</p>}<div className="modal-foot"><LockKeyhole size={13}/> Preview only · No payment is processed</div></section></div>}
    </main>
  );
}
