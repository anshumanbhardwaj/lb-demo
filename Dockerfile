# Stage 1: Build the application
FROM node:18 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY . .

# Install dependencies
RUN npm install

# Build the app (if you have any build steps like TypeScript compilation)
RUN npm run build

# Stage 2: Run the application
FROM node:18-alpine AS production

# Set NODE_ENV to production
ENV NODE_ENV=production

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app /app

# Expose the port Fastify will listen on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "run", "server"]
