FROM node:16

WORKDIR /home/node/app

COPY package* ./

RUN npm install

RUN npm install -g serve

COPY . .

RUN npm run build

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]

# docker build . -t frontend-project && docker run -p 5000:5000 frontend-project
