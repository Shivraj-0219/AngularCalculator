#FROM Directive -Install node image form docker hub
FROM node:14-alpine3.14 AS build-step

#ENV Directive - Setup Environment variables
ENV APP_DATA /opt/angular/mycalculator

#RUN Directive - Make directory for destination build location
RUN mkdir -p "$APP_DATA"

#WORKDIR Directive --Set Up Path to execute
WORKDIR $APP_DATA

# COPY directive - Copy From Host To Image
COPY . /opt/angular/mycalculator

# RUN directive - run commands
RUN npm install
RUN npm install -g @angular/cli

# RUN directive - run commands
RUN ng build

# From directive - Deploying Build war file to Apache HTTPD Web Server
FROM httpd:alpine

# COPY directive - Copy From Host To Image
COPY --from=build-step /opt/angular/mycalculator/dist/angularCalc /usr/local/apache2/htdocs/
 
