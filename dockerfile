# Build the Go Binary.
FROM golang:1.17.3-alpine3.13 as build_stage
WORKDIR /cmd
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -mod=mod -o passgen github.com/tullo/passgen/cmd

FROM alpine:3.19.0
COPY --from=build_stage /cmd/passgen /cmd/
ENTRYPOINT ["/cmd/passgen"]
