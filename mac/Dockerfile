FROM golang:1.24.0-alpine3.20

ARG OCB_VERSION=0.120.0
WORKDIR /app

COPY . .

RUN curl --proto '=https' --tlsv1.2 -fL -o ocb \
    https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/cmd%2Fbuilder%2Fv${OCB_VERSION}/ocb_${OCB_VERSION}_darwin_amd64
RUN chmod +x ocb
RUN ./ocb build --config builder-config.yaml

RUN go build -o ../generated/mz-otelcol main.go