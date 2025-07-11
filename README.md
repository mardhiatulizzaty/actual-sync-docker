# 🧾 Actual Budget (Docker Self-Hosted Version)

A self-hosted version of [Actual Budget](https://actualbudget.org) using Docker — a privacy-respecting, local-first personal finance manager that's 100% free and open source.

This setup is perfect for individuals who want to manage their money **without paying RM 500+ per year**, while gaining **full control of their data**.

---

## 📦 What Is Actual Budget?

**Actual Budget** is an open-source alternative to tools like YNAB (You Need A Budget). It features:

- Envelope-style budgeting
- Fast, local-first app experience
- No bank syncing (manual = more mindful)
- Full offline support
- Sync across devices via self-hosted server

It’s built using Node.js and stores data in SQLite, making it fast and lightweight.

---

## 🐳 Why This Repo?

This repo contains a simple, Docker-based method to deploy **Actual's Sync Server** to any platform that supports Docker (like [Render](https://render.com), Replit, Railway, or VPS).

✅ No monthly fees  
✅ Your data stays with you  
✅ Works great with the free Actual Budget desktop app

---

## 🚀 Quick Start (Render Deployment)

> This guide assumes you're deploying to [Render.com](https://render.com), which offers a **free tier**.

### 🛠️ 1. Fork This Repo

Click the **Fork** button at the top of the page to copy this repo to your GitHub account.

### 🐳 2. Deploy to Render

1. Go to [https://dashboard.render.com](https://dashboard.render.com)
2. Click **"New Web Service"**
3. Select **"Deploy from a GitHub repo"**
4. Choose your forked repo
5. Configure as follows:

| Field            | Value                                      |
|------------------|--------------------------------------------|
| **Name**         | actual-budget                              |
| **Environment**  | Docker                                     |
| **Region**       | Your nearest region                        |
| **Branch**       | `main`                                     |
| **Dockerfile Path** | `Dockerfile` (default)                  |
| **Build Command**| _Leave empty_                              |
| **Start Command**| _Leave empty_ (Handled in Dockerfile)      |
| **Port**         | _Auto-detected_ by Docker                  |

6. Click **Create Web Service**
7. Wait for build & deploy to complete
8. Copy the Render app URL (e.g. `https://your-app-name.onrender.com`)

---

## 💻 Connect to Your Self-Hosted Server

1. Download the [Actual Budget Desktop App](https://actualbudget.org)
2. Click **“Sync with self-hosted server”**
3. Paste your Render URL (e.g. `https://your-app-name.onrender.com`)
4. Create your account and start budgeting!

---

## 📦 Dockerfile Overview

This repo uses:
- `@actual-app/sync-server` from npm
- Render’s `PORT` variable injected into a temporary config file
- A persistent `/data` volume (optional but recommended for real backup)

```Dockerfile
FROM node:20

RUN npm install -g @actual-app/sync-server

EXPOSE 5006

CMD bash -c "echo '{\"port\":' $PORT ', \"dataDir\": \"/data/.actual-data\"}' > config.json && actual-server --config config.json"
