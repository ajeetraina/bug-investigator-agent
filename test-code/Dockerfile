# Dockerfile - Has optimization issues for Bug Investigator to find

FROM node:18

# Issue: Not using alpine (larger image)
# Issue: No .dockerignore

WORKDIR /app

# Issue: Copies everything first, breaks layer cache
COPY . .

RUN npm install

# Issue: No multi-stage build
RUN npm run build

# Issue: Running as root (security)
# Issue: No health check

CMD ["npm", "start"]
