# Dockerfile for cron-ticker service
# This Dockerfile sets up a Node.js environment for the cron-ticker service
# It uses the official Node.js Alpine image for a lightweight build

# STAGE 1: Build dependencies
FROM node:24-alpine3.22 as dependencies

# Change the working directory to /app
WORKDIR /app

# Copy the package.json file into the container
COPY package.json .

# Install the necessary dependencies
RUN npm install


# STAGE 2: Tests
FROM node:24-alpine3.22 as test-build

WORKDIR /app

# Copy dependencies from the previous stage
COPY --from=dependencies /app/node_modules ./node_modules

# Copy the application code into the container
COPY . .

# Run the application tests
# This step ensures that the application is working correctly before starting it
RUN npm run test


# STAGE 3: Build production dependencies
FROM node:24-alpine3.22 as dependencies-prod

# Change the working directory to /app
WORKDIR /app

# Copy the package.json file into the container
COPY package.json .

# Install the necessary dependencies
RUN npm install --prod

# STAGE 4: Production build
FROM node:24-alpine3.22 as runner

WORKDIR /app

# Copy dependencies from the previous stage
COPY --from=dependencies-prod /app/node_modules ./node_modules

# Copy the application code into the container
COPY app.js .
COPY tasks ./tasks

# Set the command to run the cron-ticker service
CMD ["npm", "start"]