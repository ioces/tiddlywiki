FROM node:alpine

RUN npm install -g tiddlywiki

ENTRYPOINT ["tiddlywiki"]
