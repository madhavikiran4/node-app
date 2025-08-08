ARG NODE_VERSION=21.6.2
FROM node:${NODE_VERSION}-alpine

ENV NODE_ENV production

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy the rest of the source files
COPY . .

USER node
EXPOSE 8080
CMD ["node", "app.js"]
