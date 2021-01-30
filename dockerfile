# Build the Go Binary.
FROM golang:1.15.7-alpine3.13 as build_stage
WORKDIR /cmd
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o passgen github.com/tullo/passgen/cmd

FROM alpine:3.13
COPY --from=build_stage /cmd/passgen /cmd/
ENTRYPOINT ["/cmd/passgen"]
