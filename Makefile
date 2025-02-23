OCB_VERSION ?= 0.120.0
.PHONY: mac
mac:
	curl --proto '=https' --tlsv1.2 -fL -o mac/ocb \
		https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/cmd%2Fbuilder%2Fv$(OCB_VERSION)/ocb_$(OCB_VERSION)_darwin_amd64
	chmod +x mac/ocb
	./mac/ocb --config mac/builder-config.yaml

install-telemetry-gen:
	go install github.com/open-telemetry/opentelemetry-collector-contrib/cmd/telemetrygen@latest

gen-trace:
	$(GOPATH)/bin/telemetrygen traces --otlp-insecure --traces 3

gen-log:
	$(GOPATH)/bin/telemetrygen logs --otlp-insecure --logs 3

gen-metric:
	$(GOPATH)/bin/telemetrygen metrics --otlp-insecure --metrics 3

simplest:
	./generated/mz-otelcol/mz-otelcol --config ./configs/simplest.yaml