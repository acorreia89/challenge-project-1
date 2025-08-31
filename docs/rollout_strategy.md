# 🚀 Estratégia de Rollout Seguro — Challenge Project 1

## Objetivo
Minimizar riscos e permitir rollback rápido durante a implantação de novas versões da aplicação.

## Estratégia Canário Progressivo

- **10%** do tráfego → pausa 2 min
- **25%** do tráfego → pausa 5 min
- **50%** do tráfego → pausa 5 min
- **100%** do tráfego

## Validação Automática

- Integrar com métricas do Prometheus:
  - Latência p95 < 300ms
  - Taxa de erros < 0,1%
- Se algum SLI violar o SLO → rollback automático

## Monitoramento Durante Rollout

- Painel no Grafana filtrando métricas/traces por versão (`app.kubernetes.io/version`)
- Alertas no Prometheus para violações de SLO

## Rollback Rápido

- Comando manual:
  ```bash
  kubectl argo rollouts undo rollout challenge-1-web -n <namespace>
