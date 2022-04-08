FROM node:14.4.0-slim

WORKDIR /opt/app

COPY . . 

RUN npm install 

EXPOSE 3000

CMD [ "node", "app.js" ]