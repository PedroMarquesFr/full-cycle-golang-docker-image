FROM golang:1.18 AS build

WORKDIR /usr/src/app
RUN echo 'package main\nimport "fmt"\nfunc main() {fmt.Println("Code.education Rocks!")}' >> main.go
RUN go mod init example/helloGo
RUN go build .

FROM scratch
WORKDIR /app
COPY --from=build /usr/src/app .
ENTRYPOINT [ "./helloGo" ]