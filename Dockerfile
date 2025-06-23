# Dockerfile for cron-ticker service
# This Dockerfile sets up a Node.js environment for the cron-ticker service
# It uses the official Node.js Alpine image for a lightweight build
# FROM node:24-alpine3.22
FROM --platform=$BUILDPLATFORM node:24-alpine3.22

# Print the build and target platform information to a log file
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log

# Change the working directory to /app
WORKDIR /app

# Copy the package.json file into the container
COPY package.json .

# Install the necessary dependencies
RUN npm install

# Copy the application code into the container
COPY . .

# Run the application tests
# This step ensures that the application is working correctly before starting it
RUN npm run test

# Remove development dependencies to keep the image size small
RUN rm -rf tests && rm -rf node_modules

# Reinstall only production dependencies
RUN npm install --prod

# Set the command to run the cron-ticker service
CMD ["npm", "start"]