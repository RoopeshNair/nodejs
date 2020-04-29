FROM node:8
LABEL maintainer="Azure App Services Container Images <appsvc-images@microsoft.com>"

# Create app directory
WORKDIR /app

COPY package*.json ./

RUN npm install
RUN npm run build --if-present
RUN npm run test --if-present

# Bundle app source
COPY . .

EXPOSE 8080 80
CMD [ "npm", "start" ]
