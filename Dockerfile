# build-stage
FROM node:18.12.0-slim as build-stage

ENV NODE_ENV production
ENV NPM_CONFIG_UPDATE_NOTIFIER false
ENV NPM_CONFIG_FUND false
ENV CI true

WORKDIR /app

COPY package*.json ./

RUN npm ci --include=dev

COPY . ./

RUN npm run build

# production-stage
FROM nginx:1.24.0-alpine-slim as production-stage

COPY --from=build-stage /app/dist /app/srv

COPY nginx.conf /etc/nginx/nginx.conf