FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json .

RUN npm install --omit=dev

COPY . .

FROM node:22-alpine AS production

WORKDIR /app

COPY --from=builder --chown=node:node /app .

USER node

EXPOSE 8080

CMD ["node", "server.js"]
