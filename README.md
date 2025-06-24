# 🚀 Full Stack AWS Deployment with Terraform (Flask + Express)

## 📌 Project Overview

This project demonstrates infrastructure automation using Terraform to deploy two applications:

- **Flask Backend**
- **Express Frontend**

It covers 3 deployment strategies using AWS services:
1. **Both apps on a single EC2 instance**
2. **Each app on separate EC2 instances**
3. **Apps containerized with Docker, pushed to ECR, and deployed via ECS Fargate with an ALB**

---

## ✅ Part 1: Flask + Express on Single EC2 Instance

### 🎯 Objective
Deploy both Flask and Express apps on a single EC2 instance running Ubuntu.

### 🛠️ Features
- Flask runs on port **5000**
- Express runs on port **3000**
- Installed dependencies using **user data**
- Deployed via `terraform apply`

### 🧱 Terraform Components
- `main.tf` (EC2 instance)
- `variables.tf` (for key, region, etc.)
- `outputs.tf` (to expose public IP)
- `user_data.sh` to install Python, Node.js, and run both apps

### 🌐 Output
- Flask: `http://<EC2-IP>:5000`
- Express: `http://<EC2-IP>:3000`

---

## ✅ Part 2: Flask and Express on Separate EC2 Instances

### 🎯 Objective
Run Flask and Express on **two separate EC2 instances** with communication enabled.

### 🛠️ Features
- Flask backend on **one EC2**
- Express frontend on **another EC2**
- Security groups allow:
  - Internet access to both apps
  - Communication between instances
- User data scripts auto-deploy the apps

### 🧱 Terraform Components
- `main.tf` (two EC2 instances)
- `vpc.tf` (custom VPC, subnets, SGs)
- `variables.tf`, `outputs.tf`

### 🌐 Output
- Flask: `http://<Flask-EC2-IP>:5000`
- Express: `http://<Express-EC2-IP>:3000`

---

## ✅ Part 3: Dockerized Flask & Express with AWS ECR, ECS, ALB

### 🎯 Objective
Containerize both apps and deploy using ECS with ALB for routing traffic.

### 🛠️ Features
- Docker images pushed to **ECR**
- ECS cluster created via Terraform
- Services run on **Fargate**
- Application Load Balancer (ALB) used for traffic distribution

### 🔧 Setup

#### 🐳 Docker & ECR
- Flask and Express apps containerized
- Two ECR repos created via Terraform
- Docker images built and pushed

#### 🖧 VPC
- Custom VPC with:
  - Public subnets
  - Internet Gateway
  - Route Tables and SGs

#### ⚙️ ECS & ALB
- ECS cluster via Fargate
- Two ECS services
- ALB listener routes:
  - `/flask` to Flask container
  - `/express` to Express container

### 🧱 Terraform Components
- `ecr.tf`
- `ecs.tf`
- `alb.tf`
- `vpc.tf`
- `iam.tf`
- `outputs.tf`, `variables.tf`

### 🌐 Outputs
- ALB DNS: http://app-lb-771713220.ap-south-1.elb.amazonaws.com
- ECR URLs:
  - Flask: `774305606512.dkr.ecr.ap-south-1.amazonaws.com/flask-app-repo`
  - Express: `774305606512.dkr.ecr.ap-south-1.amazonaws.com/express-app-repo`

---

## 📦 Folder Structure


Nilesh@Nilesh-PC MINGW64 ~/GitHub_Tutorial/terraform-part1-single-ec2 (main)
$ tree
.
|-- MyNewKeyPair.pem
|-- alb.tf
|-- docker
|   |-- express
|   |   |-- Dockerfile
|   |   |-- app.js
|   |   `-- package.json
|   `-- flask
|       |-- Dockerfile
|       |-- app.py
|       `-- requirements.txt
|-- ecr.tf
|-- ecs-cluster.tf
|-- ecs-service.tf
|-- ecs-task.tf
|-- iam.tf
|-- main.tf
|-- network.tf
|-- outputs.tf
|-- terraform.tfstate
|-- terraform.tfstate.backup
|-- terraform.tfvars
|-- user_data.sh
|-- user_data_express.sh
|-- user_data_flask.sh
`-- variables.tf

3 directories, 23 files
## 📸 Screenshots & Command Logs


