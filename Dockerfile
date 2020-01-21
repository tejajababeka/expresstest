FROM node:10 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i express

RUN yarn install --network-timeout 1000000

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

