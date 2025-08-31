// Inicializa o tracer no navegador
const { WebTracerProvider } = opentelemetry.sdkTraceWeb;
const { BatchSpanProcessor } = opentelemetry.sdkTraceBase;
const { OTLPTraceExporter } = opentelemetry.exporterTraceOtlpHttp;
const { ZoneContextManager } = opentelemetry.contextZone;
const { registerInstrumentations } = opentelemetry.instrumentation;
const { FetchInstrumentation } = opentelemetry.instrumentationFetch;
const { XMLHttpRequestInstrumentation } = opentelemetry.instrumentationXmlHttpRequest;

// Configura o provedor de traces
const provider = new WebTracerProvider();

// Exportador OTLP para o Collector
const exporter = new OTLPTraceExporter({
  url: "http://otel-collector.observability.svc.cluster.local:4318/v1/traces"
});

provider.addSpanProcessor(new BatchSpanProcessor(exporter));
provider.register({
  contextManager: new ZoneContextManager()
});

// Instrumenta fetch() e XMLHttpRequest
registerInstrumentations({
  instrumentations: [
    new FetchInstrumentation(),
    new XMLHttpRequestInstrumentation()
  ]
});

const tracer = opentelemetry.trace.getTracer("challenge-1-web");

// Exemplo: gerar um trace ao clicar no botão
document.getElementById("traceButton").addEventListener("click", () => {
  const span = tracer.startSpan("botao-trace-clicado");
  console.log("Trace gerado:", span);
  setTimeout(() => {
    span.end();
    alert("Trace enviado para o Collector!");
  }, 500);
});
