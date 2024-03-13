FROM node:16 AS pre-build

WORKDIR /usr/src/app

COPY . .

RUN npm install -g serve && \
    npm install && \
    npm run build

FROM node:16-alpine3.13

EXPOSE 5000

ENV REACT_APP_BACKEND_URL=http://localhost:8080

WORKDIR /usr/src/app

COPY --from=pre-build /usr/src/app/build/ /usr/src/app/build

RUN npm install -g serve && \
    adduser -D appuser && \
    chown appuser build

USER appuser

ENTRYPOINT [ "serve", "-s", "-l", "5000", "build" ]