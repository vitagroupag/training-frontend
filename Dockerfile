# Use an official NodeJS image as the base image
FROM node:18.14-alpine

# Create app directory
WORKDIR /usr/src/app
COPY --chown=node:node . .

# Set node ENV
ENV NODE_ENV production

# Install app dependencies
COPY package*.json ./

# Install 
RUN npm ci --only=production

# Bundle app source
COPY . .

# Expose port 8080
EXPOSE 8080

# Set the user to node
USER node

# Run the app
CMD [ "node", "server.js" ]
