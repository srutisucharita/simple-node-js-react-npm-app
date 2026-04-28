FROM node:22

WORKDIR /app

COPY . .

RUN cd backend && npm install
RUN cd frontend && npm install && npm run build

EXPOSE 3000

CMD ["node", "backend/server.js"]
