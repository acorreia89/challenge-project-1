# 🚀 Challenge Project 1

## 📌 Descrição
Este projeto implementa uma aplicação web containerizada e implantada em um cluster **Kubernetes (EKS)** utilizando **GitOps com ArgoCD**, **CI/CD com GitHub Actions** e **observabilidade completa** com **OpenTelemetry**, **Prometheus**, **Grafana Tempo** e **Loki**.

O objetivo é demonstrar práticas modernas de **SRE** (Site Reliability Engineering) e **DevOps**, garantindo **resiliência**, **confiabilidade** e **visibilidade** de ponta a ponta.

---

## 🎯 Objetivos
- Provisionar infraestrutura **EKS** com **Terraform**
- Deploy da aplicação via **Helm Chart**
- Pipeline **CI/CD** para build, push no **ECR** e atualização GitOps
- Estratégia de rollout **canário** com **Argo Rollouts**
- Observabilidade com métricas, traces e logs
- Dashboards no Grafana para monitoramento

---

## 🛠 Tecnologias

- **Infraestrutura**: Terraform, AWS EKS, AWS ECR, IAM
- **Orquestração e Deploy**: Kubernetes, ArgoCD, Argo Rollouts, Helm
- **CI/CD**: GitHub Actions
- **Observabilidade**: OpenTelemetry, Prometheus, Grafana Tempo, Grafana Loki
- **Visualização**: Grafana
- **Linguagens e Configuração**: YAML, Dockerfile, Bash

---

## 🧰 Ferramentas Necessárias

Antes de iniciar, certifique-se de ter as seguintes ferramentas instaladas no seu ambiente local:

| Ferramenta | Descrição | Link Oficial |
|------------|-----------|--------------|
| **Terraform** | Provisionamento de infraestrutura como código (IaC), usado para criar o cluster EKS e recursos AWS. | [terraform.io](https://www.terraform.io/) |
| **Docker** | Plataforma para criar, empacotar e executar aplicações em containers. | [docker.com](https://www.docker.com/) |
| **Helm** | Gerenciador de pacotes para Kubernetes, usado para instalar e atualizar aplicações via charts. | [helm.sh](https://helm.sh/) |
| **kubectl** | CLI oficial do Kubernetes para gerenciar e interagir com o cluster. | [kubernetes.io/docs/reference/kubectl](https://kubernetes.io/docs/reference/kubectl/) |
| **AWS CLI** | Interface de linha de comando para interagir com serviços AWS, como EKS e ECR. | [aws.amazon.com/cli](https://aws.amazon.com/cli/) |

💡 **Dica:** Após instalar, verifique se cada ferramenta está funcionando com:
```bash
terraform -version
docker --version
helm version
kubectl version --client
aws --version

---
## 🗂 Estrutura do Repositório

```plaintext
app/                        # Código da aplicação e Dockerfile
gitops-repo/
  ├── webapps/
  │   └── challenge-1-web/  # Helm chart da aplicação
  └── observability/        # Manifests de observabilidade
      ├── otel-collector/   # OpenTelemetry Collector
      ├── prometheus/       # Prometheus
      ├── tempo/            # Grafana Tempo
      └── loki/             # Grafana Loki
.github/workflows/          # Pipelines GitHub Actions
terraform/eks/              # Provisionamento do cluster EKS


