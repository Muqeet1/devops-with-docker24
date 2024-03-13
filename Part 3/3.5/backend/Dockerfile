FROM alpine:latest

WORKDIR /usr/src/app

RUN apk add --no-cache go

COPY . .

EXPOSE 8080

RUN go build

RUN chmod +x ./server

ENV PORT=8080

ENV REQUEST_ORIGIN=http://localhost:5000

RUN addgroup -S appgroup && adduser -S -G appgroup appuser

RUN chown appuser .

USER appuser

CMD ["./server"]

# docker build . -t example-backend && docker run -p 8080:8080 example-backend
