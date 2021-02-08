FROM node:14 as node

WORKDIR /app
COPY ./ /app
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=node /app/dist/platzi-store-complete /usr/share/nginx/html