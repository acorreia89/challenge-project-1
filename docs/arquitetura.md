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
