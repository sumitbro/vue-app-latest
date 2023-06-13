FROM node:14-alpine as builder
ARG VUEJS_WEB_DIR=/var/www/html/vuejs

RUN mkdir -p $VUEJS_WEB_DIR/
RUN apk add --no-cache \
    autoconf \
        automake \
        bash \
        g++ \
        libc6-compat \
        libjpeg-turbo-dev \
        libpng-dev \
        make \
        libtool \
        python3 \
        nasm \
        build-base shadow vim curl 

WORKDIR $VUEJS_WEB_DIR
COPY . .

RUN npm install
RUN npm install vue-confirm-dialog@1.0.2 --save
RUN npm run build

FROM nginx:alpine
RUN apk add curl \
    && mkdir -p /var/www/html/vuejs/dist

WORKDIR /var/www
COPY . /var/www/html/vuejs
COPY --from=builder /var/www/html/vuejs/dist /var/www/html/vuejs/dist
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443