# Utilise une image Node officielle
FROM node:18

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers
COPY . .

# Lancer l'application
CMD ["node", "index.js"]

# Exposer le port (modifie si nécessaire)
EXPOSE 3000
