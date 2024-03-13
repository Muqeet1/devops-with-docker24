FROM node:16

WORKDIR /home/node/app

COPY package* ./

RUN npm install

RUN npm install -g serve

COPY . .

EXPOSE 5000

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm run build

RUN useradd -m appuser

RUN chown appuser .

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]

# docker build . -t frontend-project && docker run -p 5000:5000 frontend-project
