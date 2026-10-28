import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "BlockCrest Capital | Digital Asset Dashboard",
  description: "A digital-asset investment platform interface.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
