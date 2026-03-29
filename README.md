# Converso: AI Learning Companion SaaS 🚀

Converso is a modern SaaS application that allows users to build and personalize their own AI learning companions. Using real-time voice AI, users can engage in natural, fun, and educational conversations on topics ranging from Math and Coding to History and Finance.

**Live Demo**: [https://saas-app-9mwu.vercel.app/](https://saas-app-9mwu.vercel.app/)

## ✨ Features

- **Personalized AI Companions**: Create unique companions by choosing their name, subject, voice, and personality.
- **Real-time Voice Interaction**: High-quality, low-latency voice conversations powered by Vapi AI.
- **My Journey Dashboard**: Track your lessons, manage your companions, and view your bookmarks in a centralized profile.
- **Subject Filtering**: Easily explore companions by subject (Math, Science, Coding, etc.).
- **Bookmarking System**: Save your favorite companions for quick access later.
- **Premium Subscriptions**: Scalable companion limits based on user plans (Clerk/Stripe integration ready).

## 🛠️ Tech Stack

- **Framework**: Next.js 15.5 (App Router)
- **Authentication**: Clerk (with Native Supabase Integration)
- **Database**: Supabase (PostgreSQL)
- **Voice AI**: Vapi AI SDK
- **Styling**: Tailwind CSS & Lucide Icons
- **Components**: Radix UI & Shadcui
- **Deployment**: Vercel

## 🚀 Getting Started

### 1. Prerequisites
- Node.js 18+ 
- A Clerk account
- A Supabase account
- A Vapi AI account

### 2. Environment Variables
Create a `.env.local` file in the root directory and add the following:

```env
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_pub_key
CLERK_SECRET_KEY=your_clerk_secret_key
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up

# Supabase
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key

# Vapi AI
NEXT_PUBLIC_VAPI_WEB_TOKEN=your_vapi_token
```

### 3. Database Setup
Run the `supabase_schema.sql` file in your Supabase SQL Editor to set up the `companions`, `session_history`, and `bookmarks` tables with appropriate RLS policies.

### 4. Installation & Run
```bash
npm install
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) to see your app!

## 🔐 Security
The application uses **RS256 asymmetric JWT signing** between Clerk and Supabase to ensure that all database operations are securely tied to the authenticated Clerk user.

## 📄 License
This project is for educational purposes. All rights reserved.
