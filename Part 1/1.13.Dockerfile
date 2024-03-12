FROM golang:1.16

WORKDIR home/golang/app

COPY . .

EXPOSE 8080

RUN go build

RUN chmod +x ./server

ENV PORT 8080

CMD ["./server"]

# docker build . -t example-backend && docker run -p 8080:8080 example-backend
