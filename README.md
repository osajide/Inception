# 🐳 Inception

## 📌 Overview
**Inception** is a project designed to build a **containerized web infrastructure** using **Docker and Docker Compose**. The goal is to create an isolated and secure environment where each service runs in its own container, following best practices for DevOps and system administration.  

The project consists of a **mandatory part** that sets up a **LEMP (Linux, Nginx, MariaDB, PHP-FPM) stack** and a **bonus part** that extends the infrastructure with additional services.

## 🔥 Mandatory Part - Core Infrastructure
The core infrastructure consists of **three main containers**, working together to serve a WordPress website:  

1️⃣ **NGINX Container**  
   - Acts as the **only entry point** to the infrastructure.  
   - Listens on **port 443** (HTTPS) with a **self-signed SSL certificate**.  
   - Configured as a **reverse proxy**, forwarding requests to PHP-FPM.  

2️⃣ **PHP-FPM Container**  
   - Executes **WordPress PHP files**.  
   - Communicates with the Nginx container over an internal Docker network.  
   - Uses the MariaDB container as the database backend.  

3️⃣ **MariaDB Container**  
   - Stores **WordPress database**.  
   - Securely configured with a dedicated user and password.  

🚀 **Key Features:**  
✔️ **Docker Compose** to orchestrate multi-container deployment.  
✔️ **Self-signed SSL certificate** for secure HTTPS communication.  
✔️ **Isolated services** with Docker networks.  
✔️ **Persistent storage** using Docker volumes.  

## ⭐ Bonus Part - Extended Infrastructure  
The **bonus part** enhances the core infrastructure by adding the following **five additional containers**:  

4️⃣ **Redis Cache Container**  
   - Improves **WordPress performance** by reducing database queries.  
   - Acts as an **object cache** for frequently accessed data.  

5️⃣ **FTP Server Container**  
   - Provides **FTP access** for **uploading/downloading** content.  

6️⃣ **Adminer Container**  
   - A lightweight **database management tool** for MariaDB.  
   - Accessible via a web interface (`http://localhost:8080`).  

7️⃣ **Grafana Container**  
   - Can be configured to track **server performance, database queries, and application logs**.  

8️⃣ **Python HTTP Server Container**  
   - Serves a **simple static website** (for testing) using Python’s `http.server` module.  
   - Nginx acts as a **reverse proxy** for this service.  

🚀 **Bonus Features:**  
✔️ **Redis caching for faster WordPress performance**.  
✔️ **Adminer for easy database management**.  
✔️ **Grafana for real-time monitoring and visualization**.  
✔️ **Secure FTP access for file management**.  
✔️ **Static website served via Python HTTP server**.


---

## 🚀 Usage  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/osajide/Inception.git
cd Inception
make
