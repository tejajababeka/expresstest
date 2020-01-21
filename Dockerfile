FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y 
 
RUN yarn install --network-concurrency 1

RUN yarn install --network-timeout 1000000

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

