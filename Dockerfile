FROM node:20-alpine AS build
WORKDIR /app
COPY app/package.json ./

# install runtime dependencies (no lockfile required)
RUN npm install --omit=dev

COPY app/ ./

FROM node:20-alpine AS runtime
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
CMD ["npm", "start"]
