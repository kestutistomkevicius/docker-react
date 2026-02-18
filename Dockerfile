FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
# needed for AWS Elastic Beanstalk to detect the container is running
EXPOSE 80 
