# 🛍️ SparkCart - Modern E-Commerce Platform

<div align="center">
  <img src="https://media.giphy.com/media/juua9i2c2fA0AIp2iq/giphy.gif" width="200" alt="E-Commerce Demo">
  <br>
  
  ![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
  ![JSP](https://img.shields.io/badge/JSP-FF6C37?style=for-the-badge)
  ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
  ![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)
</div>

## 🌟 Key Features
- **Multi-Vendor Marketplace**
- **AJAX-Powered Product Search** 🔍
- **Admin Dashboard** 📊 with Analytics
- **Responsive Design** 📱💻

## 🚀 Quick Start

graph TD
    A[JSP Views] --> B[Servlets]
    B --> C[Service Layer]
    C --> D[DAO Layer]
    D --> E[MySQL Database]
    B --> F[Razorpay API]

```bash
# Clone with SSH
git clone git@github.com:dvish2003/E-Commerce.git

# Initialize Database
mysql -u root -p < database/ecommerce_db.sql

# Deploy to Tomcat
mvn clean package
cp target/SparkCart.war $CATALINA_HOME/webapps/



├── src/
│   ├── main/
│   │   ├── java/com/sparkcart/
│   │   │   ├── controllers/      # Servlets
│   │   │   ├── services/        # Business Logic
│   │   │   ├── dao/             # Database Access
│   │   │   └── models/          # POJOs
│   │   ├── webapp/
│   │   │   ├── assets/          # CSS/JS/Images
│   │   │   ├── admin/           # Admin Views
│   │   │   └── user/           # Customer Views
│   │   └── resources/          # Config Files
├── database/                   # SQL Scripts
└── pom.xml                    # Maven Config
