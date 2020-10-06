FROM alpine:3.7
LABEL maintainer="MPN"
LABEL version="1"

# Install required packages for next installs
RUN apt-get update && apt-get install -y wget gnupg2 curl build-essential

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Update npm to latest version
RUN npm install npm@latest -g

# Install essential packages for ci tasks
RUN npm install --global eslint

# Run cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Run command line
CMD /bin/bash