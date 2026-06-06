# 🎓 University Management System Deployment on Oracle Kubernetes Engine (OKE)

## 📖 Overview

This project demonstrates the deployment of a cloud-native **University Management System** based on a **Microservices Architecture** running on **Oracle Kubernetes Engine (OKE)**.

The application consists of multiple Spring Boot microservices communicating through a centralized API Gateway and registered in a Eureka Discovery Server. Configuration management is centralized using Spring Cloud Config Server, while each business service maintains its own dedicated MySQL database to ensure loose coupling and service independence.

The entire platform is deployed inside the Kubernetes namespace **`faculty-app`**. Application and database components are packaged and deployed using **Helm Charts**, while sensitive configuration is secured through **Kubernetes Secrets**. Deployment and cleanup operations are fully automated using shell scripts.

---

## 🏗️ Architecture

The system is composed of the following components:

### Frontend

* Angular Frontend

### Infrastructure Services

* API Gateway
* Eureka Discovery Server
* Spring Cloud Config Server

### Business Services

* Authentication Service
* Faculty Service
* Subject Service
* Exam Service

### Databases

* Auth MySQL Database
* Faculty MySQL Database
* Subject MySQL Database
* Exam MySQL Database

---

## 📊 System Architecture

```text
                    Angular Frontend
                           │
                           ▼
                     API Gateway
                           │
                           ▼
                   Eureka Discovery
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
   Auth Service     Faculty Service    Subject Service
        │                  │                  │
        ▼                  ▼                  ▼
    Auth DB          Faculty DB         Subject DB
                           │
                           ▼
                     Exam Service
                           │
                           ▼
                        Exam DB
```

---

## 🚀 Technology Stack

### Backend

* Java 17
* Spring Boot
* Spring Cloud
* Spring Security
* Spring Cloud Gateway
* Eureka Server
* Spring Config Server

### Frontend

* Angular

### Database

* MySQL

### Containerization

* Docker

### Orchestration

* Kubernetes
* Oracle Kubernetes Engine (OKE)

### Package Management

* Helm 3

### CI/CD & Automation

* Bash Scripts

### Security

* Kubernetes Secrets

---

## 📂 Project Structure

```text
.
├── api-gateway/
├── auth-service/
├── config-server/
├── discovery-server/
├── exam-service/
├── faculty-service/
├── frontend/
├── subject-service/
│
├── charts/
│   ├── api-gateway-chart/
│   ├── auth-service-chart/
│   ├── config-server-chart/
│   ├── discovery-server-chart/
│   ├── exam-service-chart/
│   ├── faculty-service-chart/
│   ├── frontend-chart/
│   ├── subject-service-chart/
│   ├── database-auth/
│   ├── database-faculty/
│   ├── database-subject/
│   └── database-exam/
│
├── env-variables/
├── deploy.sh
├── clear_all.sh
├── docker-compose.yml
├── specification.pdf
└── README.md
```

---

## ☁️ Oracle Kubernetes Engine (OKE)

The application is deployed on Oracle Cloud Infrastructure using Oracle Kubernetes Engine.

### Cluster Features

* Managed Kubernetes Control Plane
* Worker Node Pools
* Integrated Load Balancer Support
* Persistent Storage Support
* High Availability
* Automatic Recovery
* Horizontal Scaling

All resources are deployed inside the namespace:

```bash
faculty-app
```

---

## 🔐 Secrets Management

Security is implemented using Kubernetes Secrets.

Each microservice has its own dedicated secret containing sensitive configuration values such as:

* Database username
* Database password
* Database URL
* JWT configuration
* Service-specific environment variables

This approach ensures:

* Service isolation
* Secure credential storage
* Simplified secret rotation
* Reduced exposure of sensitive data

---

## 🛢️ Database Architecture

The application follows the **Database per Service** pattern.

Each microservice owns a dedicated MySQL database:

| Service         | Database         |
| --------------- | ---------------- |
| Auth Service    | Auth Database    |
| Faculty Service | Faculty Database |
| Subject Service | Subject Database |
| Exam Service    | Exam Database    |

Each database is deployed independently through its own yaml files.

Benefits include:

* Data isolation
* Independent maintenance
* Better fault tolerance
* Loose coupling between services
* Improved scalability

---

## 📦 Helm Deployment

All application components and databases are deployed using Helm Charts.

### Available Helm Charts

| Chart                  |
| ---------------------- |
| api-gateway-chart      |
| auth-service-chart     |
| config-server-chart    |
| discovery-server-chart |
| faculty-service-chart  |
| subject-service-chart  |
| exam-service-chart     |
| frontend-chart         |

Advantages of using Helm:

* Version-controlled deployments
* Reusable templates
* Easy configuration management
* Simplified upgrades and rollbacks
* Consistent deployments across environments

---

## ⚙️ Automated Deployment

The entire deployment process is automated using the `deploy.sh` script.

### Deployment Workflow

The script performs the following tasks:

1. Creates the `faculty-app` namespace
2. Deploys Kubernetes Secrets
3. Deploys MySQL databases
4. Deploys Config Server
5. Deploys Eureka Discovery Server
6. Deploys Authentication Service
7. Deploys Faculty Service
8. Deploys Subject Service
9. Deploys Exam Service
10. Deploys API Gateway
11. Deploys Angular Frontend
12. Verifies deployment status

### Deploy the Platform

```bash
chmod +x deploy.sh

./deploy.sh
```

---

## 🧹 Cleanup

The project includes a cleanup script that removes all deployed resources from the cluster.

### Remove All Resources

```bash
chmod +x clear_all.sh

./clear_all.sh
```

The script removes:

* Helm Releases
* Deployments
* Services
* Pods
* Secrets
* ConfigMaps
* Databases
* Persistent Volume Claims

This makes it easy to recreate the environment from scratch.

---

## 🔄 Service Discovery

The platform uses **Netflix Eureka** for service discovery.

Responsibilities include:

* Service registration
* Service lookup
* Dynamic endpoint resolution
* Improved resilience in distributed environments

All services automatically register with the Discovery Server upon startup.

---

## 🌐 API Gateway

The API Gateway acts as the single entry point for all client requests.

Features:

* Request routing
* Centralized access management
* Service abstraction
* Dynamic service discovery integration
* Simplified client communication

---

## 📈 Scalability

The architecture is designed to scale horizontally.

Example:

```bash
kubectl scale deployment faculty-service \
--replicas=3 \
-n faculty-app
```

Benefits:

* Increased availability
* Better resource utilization
* Improved fault tolerance
* Enhanced performance under load

---

## 🔍 Monitoring and Troubleshooting

### Check Pods

```bash
kubectl get pods -n faculty-app
```

### Check Services

```bash
kubectl get svc -n faculty-app
```

### Check Deployments

```bash
kubectl get deployments -n faculty-app
```

### Check Secrets

```bash
kubectl get secrets -n faculty-app
```

### View Logs

```bash
kubectl logs <pod-name> -n faculty-app
```

### Describe Resources

```bash
kubectl describe pod <pod-name> -n faculty-app
```

---

## 🎯 Key Features

✅ Oracle Kubernetes Engine (OKE)

✅ Kubernetes Namespace Isolation (`faculty-app`)

✅ Spring Boot Microservices

✅ Angular Frontend

✅ Spring Cloud Gateway

✅ Eureka Service Discovery

✅ Spring Cloud Config Server

✅ Dedicated Database per Service

✅ MySQL Databases

✅ Helm-Based Deployments

✅ Kubernetes Secrets

✅ Automated Deployment Script

✅ Automated Cleanup Script

✅ Scalable Cloud-Native Architecture

✅ Service Isolation and Independent Scaling

---

## 👨‍💻 Author

This project demonstrates the deployment of a University Management System based on the microservices implementation developed by GitHub user **<a href="https://github.com/bojanzdelar">bojanzdelar</a>**.

The deployment infrastructure was designed using:

* Oracle Kubernetes Engine (OKE)
* Kubernetes
* Helm
* Docker
* Spring Boot
* Spring Cloud
* Angular
* MySQL

The project showcases modern cloud-native deployment practices including microservices architecture, service discovery, centralized configuration management, secure secret handling, database isolation, automated deployment, and container orchestration using Kubernetes.
