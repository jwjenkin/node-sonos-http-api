ARG PORT

FROM node:17-alpine

ENV APP_HOME=/app
ENV APP_PORT=${PORT:-80}

WORKDIR $APP_HOME

COPY . $APP_HOME

RUN echo "{ \
  port: $APP_PORT\
}" > settings.json

RUN npm install --production

CMD [ "node", "server.js" ]

EXPOSE ${APP_PORT}

