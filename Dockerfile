FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


FROM node:18-alpine
WORKDIR /app
COPY --from=build /app  .
RUN npm install --production 
CMD ["node","server.js"]