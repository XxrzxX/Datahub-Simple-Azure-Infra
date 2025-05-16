</p>
<p align="center">
    <h1 align="center">Azure Infrastructure Deployment for DataHub Platform 🗃 </h1>
</p>

<br>
<br>

<p align="Center">
    <em>   🚀 Stack </em>
</p>
<p align="center">
	<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25?logo=gnubash&logoColor=fff&style=flat" alt="GNU%20Bash">
  <img src="https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=fff&style=flat" alt="Docker">
  <img src="https://img.shields.io/badge/DataHub-FF6D3A?logo=datahub&logoColor=fff&style=flat" alt="DataHub">
  <img src="https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=fff&style=flat" alt="Azure">
	<img src="https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white" alt="Terraform" >
	<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON"></p>
  
</div>
<hr>


#### 🔗 Quick Links

- [📍 Overview](#-overview)
- [✨Features](#-features)
- [📂 Project Structure](#-project-structure)
- [🚀 Getting Started](#-getting-started)
    - [🔖 Prerequisites](#-prerequisites)
    - [📦 Installation](#-installation)
    - [🤖 Usage](#-usage)
- [ ⚖ License](#-license)


<br>
<br>

## 📍 Overview
This project provides a quick and reproducible way to deploy [DataHub](https://datahubproject.io/) — an open-source metadata platform — on a single Azure Virtual Machine. The infrastructure is provisioned using **Terraform**, while **Docker** handles containerization of the DataHub services. This setup is ideal for local testing, development, or proof-of-concept environments.

<br>
<br>

---

## **✨ Features**  

| Feature               | Description                                                                                   |
|------------------------|-----------------------------------------------------------------------------------------------|
| ⚙️ **IaC Setup**         | Uses **Terraform** to provision Azure resources, including the virtual machine and networking. |
| 🐳 **Dockerized**        | Installs **Docker** and deploys DataHub services using official Docker containers.            |
| 🔐 **Secure Access**     | Runs Docker in **rootless mode** and enables **TLS encryption** via **Let's Encrypt**.         |
| 🔁 **Reproducible**      | Fully reproducible setup using Infrastructure as Code — consistent deployments every time.     |
| 💻 **Simple Deployment** | Entire DataHub stack runs on a single VM — quick to set up, manage, and tear down.            |

---

 
## **📂 Project Structure**
```sh
.
|── Terraform
   ├── Setup_Scripts
   ├── modules
   │   ├── VM
   │   ├── Vnet
   ├── main.tf
   ├── outputs.tf
   ├── provider.tf
   ├── terraform.tfvars
   └── variables.tf
```

## 🚀 Getting Started

### 🔖 Prerequisites  

Before proceeding with the setup, ensure you have the following:  

- An active **Azure Subscription**  
- **Azure CLI** authenticated to your account  
- **Terraform** installed on your system  
- **WSL** or a **Linux-based system** for execution  
  <br>
  
> [!Note]
>  For detailed setup instructions, refer to the [Wiki](https://github.com/XxrzxX/Datahub-Simple-Azure-Infra/wiki).  

<br>

### 📦 Installation

Build the project from source:

1. Clone the Datahub-Simple-Azure-Infra repository:
```sh
❯ git clone https://github.com/XxrzxX/Datahub-Simple-Azure-Infra
```

2. Navigate to the project directory:
```sh
❯ cd Datahub-Simple-Azure-Infra
```

3. Install the required dependencies:
   
🔗 [Terraform Installation Guide](https://developer.hashicorp.com/terraform/install)  
🔗 [Azure CLI Installation Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) 

<br>

### 🤖 Usage

To run setup project infrustucutre , execute the following command:
```sh
❯ cd Terraform  
❯ terraform init  
❯ terraform validate  
❯ terraform plan  
❯ terraform apply 
```

## ⚖ License  

This project is licensed under the **MIT License**.  

For more details, see the [LICENSE](./LICENSE) file.  
