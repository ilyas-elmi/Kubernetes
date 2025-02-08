# Kubernetes Minikube Deployment on AWS

## Overview
This project demonstrates the deployment of a Kubernetes application using **Minikube** on an **AWS EC2 instance**. The setup provides a controlled environment for testing and exploring Kubernetes concepts in a cloud-based infrastructure.

## Key Highlights
- **Cloud-Based Kubernetes Setup** – Minikube is deployed on an AWS EC2 instance, eliminating the complexities of local installation and providing a scalable testing environment.
- **Infrastructure as Code Compatibility** – While manual provisioning is used for demonstration purposes, the setup can be automated using IaC tools.
- **Containerized Application Deployment** – A sample application is deployed using Kubernetes manifests, showcasing containerized workloads in a managed environment.
- **Service Exposure and Networking** – The deployment includes service exposure via NodePort and port forwarding, allowing external access to the running application.
- **Security and Access Control** – EC2 security groups are configured to restrict access while enabling necessary connectivity for SSH and application access.

## Project Components
- **AWS EC2 Instance** – Serves as the compute resource for running Minikube.
- **Docker & Minikube** – Used to create a lightweight, single-node Kubernetes cluster.
- **Kubernetes Deployment** – Manages application instances and ensures high availability.
- **Kubernetes Service** – Exposes the application and enables external access.
- **Networking Configuration** – Implements port forwarding and security group rules to facilitate secure connectivity.

## Application Deployment
A simple containerized application is deployed within the Minikube cluster. The application responds with the name of the serving pod, demonstrating how Kubernetes load balances requests across multiple instances.

### Deployment Workflow
1. **Provision an EC2 instance** with the required security group configurations.
2. **Install Minikube and Kubernetes CLI (kubectl)** to set up the cluster.
3. **Deploy the application** using Kubernetes manifests.
4. **Expose the service** to allow external access.
5. **Test the deployment** by accessing the application via the assigned URL.
---

```mermaid
flowchart TD
    A["Client (HTTP Request on Port 3000)"] --> B["AWS EC2 Instance (Minikube Node)"]
    B --> C["Kubernetes Service (echo-server-service)"]
    C --> D["kube-proxy (NodePort forwarding)"]
    D --> E["Kubernetes Deployment (echo-server)"]
    E --> F["Pod Instance 1"]
    E --> G["Pod Instance 2"]
 ```   
