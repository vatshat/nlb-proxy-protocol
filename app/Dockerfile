FROM mhart/alpine-node:7.4.0

WORKDIR /srv
ADD . .
RUN npm install

EXPOSE 8080
CMD ["node", "server.js"]
