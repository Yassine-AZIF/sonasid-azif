# Utilise une image Node.js officielle (Linux)
FROM node:18

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste du code
COPY . .

# Exposer le port utilisé par l'app
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["node", "index.js"]
