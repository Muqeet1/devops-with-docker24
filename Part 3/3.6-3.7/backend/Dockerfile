FROM golang:1.16 AS pre-build

WORKDIR /usr/src/app

COPY . .

ENV CGO_ENABLED=0
RUN go build && \ 
    adduser appuser && \
    chown appuser server


FROM scratch

WORKDIR /usr/src/app

COPY --from=pre-build /usr/src/app/server /usr/src/app
COPY --from=pre-build /etc/passwd /etc/passwd

EXPOSE 8080

ENV REQUEST_ORIGIN=http://localhost:5000

USER appuser

ENTRYPOINT ["./server"]

# docker build . -t example-backend && docker run -p 8080:8080 example-backend
