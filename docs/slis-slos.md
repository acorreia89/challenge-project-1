# 📊 SLIs e SLOs — Challenge Project 1

## SLIs (Service Level Indicators)

| Categoria         | SLI                                                                 | Fonte de dados |
|-------------------|---------------------------------------------------------------------|----------------|
| Disponibilidade   | % de requisições HTTP 2xx sobre o total                             | Prometheus (`http_requests_total`) |
| Latência          | Tempo de resposta p95 < 300ms                                       | Prometheus + OTEL |
| Taxa de erros     | % de respostas HTTP 5xx sobre o total                               | Prometheus |
| Traces completos  | % de spans com todos os serviços esperados                         | Grafana Tempo |
| Logs de erro      | Nº de entradas de log com nível `error` por minuto                  | Grafana Loki |

## SLOs (Service Level Objectives)

| Categoria         | SLO                                                                 |
|-------------------|---------------------------------------------------------------------|
| Disponibilidade   | ≥ 99,9% de requisições bem-sucedidas/mês                            |
| Latência          | p95 ≤ 300ms em 99% do tempo                                         |
| Taxa de erros     | ≤ 0,1% de respostas HTTP 5xx/semana                                 |
| Traces completos  | ≥ 95% dos traces com todos os spans esperados                      |
| Logs de erro      | ≤ 5 erros/minuto em produção                                        |


