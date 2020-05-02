#BUILD phase
#docker file for production                 
FROM node:alpine as builder         

#as is 

WORKDIR '/app'

COPY ./package.json ./

RUN npm install


COPY ./ ./

RUN npm run build 


#the FROM denotes that there is a new phase
#RUN phase
FROM nginx
#we do this to instruct AWS to expose port 80
EXPOSE 80
#copy from the previous phase, builder
COPY --from=builder /app/build /usr/share/nginx/html

#the default command of the nginx container is to start the nginx 





