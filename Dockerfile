FROM golang:alpine3.10 AS compiler

WORKDIR /usr/src/app
RUN go mod init app
COPY hello.go ./
RUN go build -ldflags "-w" .

FROM hello-world:latest
WORKDIR /
COPY --from=compiler /usr/src/app/app ./app
ENTRYPOINT [ "./app" ]