FROM node:16-alpine as builder
WORKDIR /usr/src/app
COPY package.json  ./
RUN yarn install --network-timeout 1000000
COPY . .
RUN yarn build


FROM nginx:1.20.1-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80

