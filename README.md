# 🌐 Azure Network Automation with Terraform Dynamic Blocks

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=240&text=Terraform%20Dynamic%20Blocks&fontSize=40&fontAlignY=40&desc=Azure%20Networking%20%7C%20Reusable%20Infrastructure%20as%20Code&descAlignY=60&fontColor=ffffff&animation=fadeIn&color=0:0078D4,50:623CE4,100:0D1117"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white"/>
  <img src="https://img.shields.io/badge/Microsoft%20Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dynamic%20Blocks-Reusable-success?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/IaC-Infrastructure%20as%20Code-orange?style=for-the-badge"/>
</p>

---

## 📌 Overview

This project demonstrates how to use **Terraform Dynamic Blocks** to automate Azure networking infrastructure.

Instead of manually defining multiple subnet blocks, the solution dynamically generates subnets using a structured variable, making the infrastructure scalable, reusable, and easier to maintain.

### Resources Provisioned

* Resource Group
* Virtual Network (VNet)
* Five Subnets
* Environment-based configuration (Dev & Prod)

---

## 🏗️ Architecture

```mermaid
flowchart TD

A[Terraform Configuration]
--> B[Resource Group]

B --> C[Virtual Network]

C --> D[Dynamic Block]

D --> E[Subnet 1]
D --> F[Subnet 2]
D --> G[Subnet 3]
D --> H[Subnet 4]
D --> I[Subnet 5]
```

---

## ✨ Key Features

| Feature                  | Description                                       |
| ------------------------ | ------------------------------------------------- |
| 🚀 Dynamic Blocks        | Automatically generates multiple subnet resources |
| 🔄 Reusable Design       | Eliminates repetitive Terraform code              |
| 🌐 Azure Networking      | Deploys VNet and subnet architecture              |
| 🏗️ Modular Structure    | Uses reusable Terraform modules                   |
| 🌍 Multi-Environment     | Supports Dev & Production environments            |
| ⚡ Scalable Configuration | Easily increase subnet count                      |

---

## 📊 Infrastructure Overview

| Resource          | Quantity   |
| ----------------- | ---------- |
| Resource Group    | 1          |
| Virtual Network   | 1          |
| Subnets           | 5          |
| Terraform Modules | 2          |
| Environments      | Dev & Prod |

---

## 📂 Repository Structure

```text
.
├── Environment
│   ├── dev/
│   │   └── provider.tf
│   │
│   └── prod/
│       └── provider.tf
│
├── Module
│   ├── azurerm_resource_group/
│   │   └── main.tf
│   │
│   └── azurerm_virtual_network/
│       ├── main.tf
│       ├── variable.tf
│       └── terraform.tfvars
│
└── README.md
```

---

## 🛠️ Technology Stack

<p align="center">
  <img src="https://skillicons.dev/icons?i=terraform,azure,git,github,vscode"/>
</p>

---

## 🚀 Deployment

### Clone Repository

```bash
git clone <repository-url>
cd project-directory
```

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Changes

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply -auto-approve
```

---

## 💡 Dynamic Block Example

```hcl
dynamic "subnet" {

  for_each = var.subnets

  content {

    name           = subnet.value.name

    address_prefix = subnet.value.address_prefix
  }
}
```

### Why Dynamic Blocks?

Without dynamic blocks, each subnet would require a separate configuration block.

Using dynamic blocks:

* Less code
* Better maintainability
* Easier scalability
* Environment flexibility

---

## 📤 Example Output

```text
rg_name   = "demo-rg"

vnet_name = "demo-vnet"

subnets = [
  "subnet-1",
  "subnet-2",
  "subnet-3",
  "subnet-4",
  "subnet-5"
]
```

---

## 🎯 Learning Outcomes

* Terraform Dynamic Blocks
* Azure Networking Fundamentals
* Infrastructure as Code (IaC)
* Reusable Terraform Modules
* Environment-Based Deployments
* Scalable Network Design

---

## 📈 Project Highlights

<p align="center">

<img src="https://img.shields.io/badge/5-Subnets-0078D4?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Dynamic%20Blocks-Terraform-623CE4?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Dev%20%7C%20Prod-Environments-success?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Azure-Networking-orange?style=for-the-badge"/>

</p>

---

## 👩‍💻 Author

**Priya Jaiswal**

Azure Cloud | DevOps | Terraform

<p align="center">
  <a href="https://github.com/Pjaisw1103">
    <img src="https://img.shields.io/badge/GitHub-Pjaisw1103-181717?style=for-the-badge&logo=github"/>
  </a>

  <a href="https://linkedin.com/in/priya-jaiswal1103">
    <img src="https://img.shields.io/badge/LinkedIn-Priya%20Jaiswal-0078D4?style=for-the-badge&logo=linkedin"/>
  </a>
</p>

---

<p align="center">
⭐ If you found this project useful, consider giving it a star.
</p>
