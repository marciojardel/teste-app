FROM node:10-slim

LABEL Name=portalcomercial

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim
ENV NODE_ROOT /usr/app/

RUN mkdir -p $NODE_ROOT
WORKDIR $NODE_ROOT
COPY . .

RUN npm install -g @angular/cli
RUN yarn install

RUN npm rebuild node-sass

EXPOSE 4200:4200

CMD [ "npm", "start" ]