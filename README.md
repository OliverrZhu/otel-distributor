# OpenTelemetry Collector Distribution

This repository contains a custom distribution of the OpenTelemetry Collector designed to be a flexible and extensible telemetry data pipeline. The distribution is built using the OpenTelemetry Collector Builder (OCB) and can be configured for various use cases.

## Key Components

### Core Functionality

This OpenTelemetry Collector distribution supports a wide range of components from the OpenTelemetry ecosystem. The specific components used can be configured through the builder configuration file. All components listed in the [OpenTelemetry Registry](https://opentelemetry.io/ecosystem/registry/) are potentially available, including:

- **Receivers**:

  - Any receiver from the registry can be added
  - Default includes OTLP (gRPC) receiver
  - Supports custom receiver configurations

- **Processors**:

  - Any processor from the registry can be added
  - Default includes batch processor
  - Supports custom processing pipelines

- **Exporters**:

  - Any exporter from the registry can be added
  - Default includes debug, Prometheus, and OTLP exporters
  - Supports custom export destinations

- **Extensions**:
  - Any extension from the registry can be added
  - Default includes health check, pprof, and zPages
  - Supports custom monitoring and diagnostics

## Configuration

The distributor supports multiple configuration files:

- `configs/simplest.yaml` - Basic configuration for quick start
- Custom YAML configurations for specific use cases

Configuration options include:

- Multiple receiver endpoints
- Custom processing pipelines
- Various exporter destinations
- Extension settings for monitoring and diagnostics

## Building and Running

To build the collector:

1. Run `make mac` to build the distribution
2. Use `./generated/mz-otelcol/mz-otelcol --config <your-config>.yaml` to run

## Telemetry Generation

The repository includes tools for testing:

- `make gen-trace` - Generate test traces
- `make gen-log` - Generate test logs
- `make gen-metric` - Generate test metrics

## Extensibility

The distributor is designed to be easily extended:

- Add new receivers, processors, and exporters through the builder configuration
- Modify the Dockerfile for custom build environments
- Create new configuration files for specific use cases
