# Build frontend
FROM node:18 AS build

WORKDIR /app
COPY . .

RUN cd frontend && npm install && npm run build
RUN cd backend && npm install

# Production image
FROM node:18

WORKDIR /app
COPY --from=build /app .

EXPOSE 3000
CMD ["node", "backend/server.js"]
