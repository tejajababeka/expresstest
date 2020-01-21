FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./
 
RUN yarn install --network-concurrency 1

RUN yarn install --network-timeout 1000000

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

