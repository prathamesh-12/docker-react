FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]

FROM ngnix
COPY --from=builder /app/build /usr/share/ngnix/html



