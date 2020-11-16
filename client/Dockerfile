# Build Phase
FROM node:14.14.0-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
# use nginx
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

#copy results of build 
COPY --from=0 /app/build /usr/share/nginx/html
#start nginx -> already default command in the nginx image