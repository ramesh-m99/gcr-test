# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:18.11.0 as build

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY ./ /usr/local/app/

# Install all the dependencies
RUN npm install --legacy-peer-deps

# Generate the build of the application
RUN npm run build


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest
COPY --from=build /usr/local/app/dist/frontend /usr/share/nginx/html