FROM node:18-bullseye-slim

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y python3
RUN apt-get install -y build-essential libudev-dev
RUN apt-get install -y ffmpeg

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

ENV NODE_ENV production

CMD [ "node", "index.js" ]