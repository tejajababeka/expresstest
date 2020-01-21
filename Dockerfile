FROM node:10 

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install --network-timeout 1000000

COPY . .

EXPOSE 3000

RUN npm start

CMD [ "npm", "start" ]

