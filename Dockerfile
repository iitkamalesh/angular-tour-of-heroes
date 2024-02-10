# Define the version for node
ARG NODE_VERSION=20.0.0

# Start your image with base image of node (switch to non-root user)
FROM node:${NODE_VERSION}-alpine

# Improve image discoverability: Titles and descriptions help users understand the image's purpose in search results or registry listings.
# Provide attribution: Author labels give credit to creators.
# Facilitate documentation: Label information can be incorporated into image
LABEL org.opencontainers.image.title="Hello Docker Learners!" \
      org.opencontainers.image.description="Welcome to heroes app" \
      org.opencontainers.image.authors="@iitkamalesh"


# Define working directory
WORKDIR /usr/app

# Copy the app package and package-lock.json file
COPY ["package.json", "package-lock.json", "./"]
 
RUN npm install
RUN npm install -g @angular/cli
# Copy only the built assets
COPY . .


CMD ["ng", "serve", "--host", "0.0.0.0"]
EXPOSE 4200/tcp