# 🐳 Inception

## 📌 Overview
**Inception** is a project designed to build a **containerized web infrastructure** using **Docker and Docker Compose**. The goal is to create an isolated and secure environment where each service runs in its own container, following best practices for DevOps and system administration.

All the services in this project are built using custom Docker images, which are written from scratch. The images are based on the **debian:bullseye** base image. Each image is carefully customized to ensure the necessary dependencies and configurations are set up properly for their respective services.

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

7️⃣ **Grafana Container**  
   - Can be configured to track **server performance, database queries, and application logs**.  

8️⃣ **Python HTTP Server Container**  
   - Serves a **simple static website** (for testing reverse proxy with nginx) using Python’s `http.server` module.  
   - Nginx acts as a **reverse proxy** for this service.  

🚀 **Bonus Features:**  
✔️ **Redis caching for faster WordPress performance**.  
✔️ **Adminer for easy database management**.  
✔️ **Grafana for real-time monitoring and visualization**.  
✔️ **Secure FTP access for file management**.  
✔️ **Static website served via Python HTTP server**.


---

## 🚀 Usage  

### 1️⃣ Clone and enter the Repository
```bash
git clone https://github.com/osajide/Inception.git
```
### 2️⃣ .env File for Configuration

The **Inception Project** includes a `.env` file that contains important environment variables and credentials used in the configuration files of various services. This file allows you to easily manage and modify sensitive data such as passwords, database credentials, and other settings that may vary depending on your environment.
The `.env` file already contains some default values for testing purposes. If you want to modify these settings (e.g., update database credentials, change the wordpress username or password, etc.), simply go to the `Inception/srcs/.env` file and update the respective values.

An example `.env` file is already provided in the project, which includes default values for testing purposes. Here’s an example of the file contents:

   ```env
# Database

DB_USER=wp_db_user
DB_PASS=1234
DB_HOST=mariadb
DB_NAME=wp_database

# Wordpress

WP_URL=tempurl
WP_TITLE=inception
ADMIN_WP_USER=admin
ADMIN_WP_PASS=admin
ADMIN_WP_EMAIL=admin@admin.com
WP_USER=user
WP_USER_PASS=1234
WP_USER_EMAIL=user@user.com
WP_USER_ROLE=editor

# ftp

FTP_USER=ftp_user
FTP_PASS=1234
```
### 3️⃣ Launch the full setup
```bash
cd Inception
make
```
### 4️⃣ Accessing the WordPress Site
Once the `make` command has been successfully executed, the WordPress site will be accessible at:
```bash
https://localhost
```
### ❗Important:
1. After running the `make` command, please wait until the WordPress setup script completes. If you access the site too early, you may encounter a "Bad Gateway" error. The setup process can take a few moments to finish, so please be patient and try again once the containers are fully up and running.
2. Since the **NGINX** container is configured with a self-signed SSL certificate, you may receive a security warning in your browser. This is expected and can be safely bypassed for testing purposes. Simply proceed by clicking on the option to continue to the website.
### 5️⃣ Accessing Adminer
Adminer will be accessible at:
```bash
http://localhost:8080
```
### 6️⃣ Accessing Grafana
Grafana will be accessible at:
```bash
http://localhost:3000
```
### 7️⃣ Accessing the Static Website
A simple static website is served using the Python `http.server` module, with NGINX acting as a reverse proxy to forward requests to the Python HTTP server.
You can access the static website at:
```bash
http://localhost:8000
