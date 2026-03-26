FROM node:25-slim
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npx vp build
RUN npm prune --omit=dev
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "--experimental-strip-types", "node_modules/@hatk/hatk/dist/main.js", "hatk.config.ts"]
