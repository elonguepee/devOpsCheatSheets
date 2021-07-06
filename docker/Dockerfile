# Choose a base image to base image on
FROM node

# Set environment variables if needed
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# Can run any linux commands
RUN mkdir -p /home/app

# Executes on the HOST machine. This example would copy files from host computer to container
COPY . /home/app

# Executes an entry point. 
CMD ["node","/home/app/server.js"]