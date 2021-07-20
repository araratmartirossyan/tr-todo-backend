FROM node:14

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait

RUN chmod +x /wait && npm install --global nodemon && npm install --global yarn --force

WORKDIR /usr/src/backend

COPY package.json /usr/src/backend/

RUN yarn

ENV PORT=3001
ENV HOST=localhost
ENV MONGO_PORT=27017
ENV MONGO_HOST=mongodb
ENV MONGO_USER=local
ENV MONGO_PASS=123456
ENV MONGO_URI=localhost:27017
ENV MONGO_DB=icwt

EXPOSE 3001

CMD /wait && yarn start
