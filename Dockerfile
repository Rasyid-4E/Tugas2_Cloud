# Gunakan base image Node.js versi LTS
FROM node:18-alpine

# Set working directory di dalam container
WORKDIR /app

# Copy file package.json dan package-lock.json dulu
# (supaya layer cache lebih efisien)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy semua source code ke dalam container
COPY . .

# Expose port yang digunakan aplikasi
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["node", "index.js"]
