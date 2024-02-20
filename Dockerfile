# Use the latest Node.js image as the base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Install the Angular CLI globally
RUN npm install -g @angular/cli

# Copy package.json and package-lock.json files to the container
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the entire Angular project to the container
COPY . .

# Build the Angular project
#RUN ng build --prod
RUN ng build --configuration=production


# Expose port 5200
EXPOSE 5200

# Serve the Angular application using the built-in Angular CLI server
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "5200", "--disable-host-check"]
