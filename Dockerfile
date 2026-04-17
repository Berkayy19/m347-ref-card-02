# Stage 1: Build the React application
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine
# Kopiert die fertigen Dateien aus dem "build" Ordner in den Nginx-Web-Ordner
# ACHTUNG: Falls dein Projekt "Vite" nutzt, ändere /app/build zu /app/dist
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]