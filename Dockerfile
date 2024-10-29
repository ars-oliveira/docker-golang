FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -ldflags "-w -s" -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]