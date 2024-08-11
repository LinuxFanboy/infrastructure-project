# Stage 1: Build the React app with npm
FROM node:20-alpine as build

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files
# These files contain information about the dependencies
COPY package.json package-lock.json ./

# Install the dependencies specified in package.json
RUN npm install

# Copy the entire application code to the working directory in the container
COPY . .

# Build the React application for production
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:stable-alpine

# Copy the built React app from the previous stage to Nginx's default HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy the custom Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
