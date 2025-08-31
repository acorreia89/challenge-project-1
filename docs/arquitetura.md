# 🏗 Arquitetura — Challenge Project 1

## Visão Geral

Este documento descreve a arquitetura do projeto, desde o fluxo de CI/CD até a camada de observabilidade.

## Diagrama

![Arquitetura Challenge Project 1](docs/challenge_arch_image.png)

## Componentes

- **GitHub Actions**: Build da imagem, push para o Amazon ECR e atualização do repositório GitOps.
- **Amazon ECR**: Armazena as imagens Docker.
- **ArgoCD**: Detecta mudanças no GitOps repo e aplica no EKS usando Helm.
- **EKS (Kubernetes)**: Orquestração da aplicação `challenge-1-web`.
- **OpenTelemetry Collector**: Recebe métricas, traces e logs da aplicação.
  - **Prometheus**: Armazena métricas.
  - **Grafana Tempo**: Armazena traces distribuídos.
  - **Grafana Loki**: Armazena logs.
- **Grafana**: Visualização e correlação de métricas, logs e traces.


## 🏗 Componentes e Ferramentas
- **Provisionamento de Cluster**:  
  O cluster **Amazon EKS** é criado e configurado via **Terraform**, garantindo reprodutibilidade e versionamento da infraestrutura.
- **Instalação de Add-ons e Componentes**:  
  Utiliza-se **Helm** para instalar e gerenciar add-ons essenciais (Ingress Controller, Autoscaler, Observabilidade, etc.) e componentes da aplicação.
- **Entrega Contínua (GitOps)**:  
  O **Argo CD** monitora o repositório GitOps e realiza o **rollout automático** das alterações no cluster.
- **Pipeline CI/CD**:  
  O **GitHub Actions** executa o build da aplicação, publica a imagem no registry e atualiza o repositório GitOps com a nova versão.
- **Observabilidade**:  
  Stack de monitoramento (Prometheus + Loki + Tempo+ Grafana ou equivalente) para métricas, logs e alertas.

## 🔄 Fluxo Resumido
1. **Código** é alterado e commitado no GitHub.
2. **GitHub Actions**:
   - Executa testes e build da imagem Docker.
   - Publica a imagem no registry.
   - Atualiza o repositório GitOps com a nova tag.
3. **Argo CD** detecta a mudança no repositório GitOps e aplica no cluster EKS.
4. **Kubernetes** agenda e executa os pods com a nova versão.
5. **Observabilidade** coleta métricas e logs para acompanhamento e troubleshooting.
