# Utiliser une image Node.js compatible Windows
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Installer Node.js manuellement (v18)
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN Invoke-WebRequest -Uri https://nodejs.org/dist/v18.20.2/node-v18.20.2-x64.msi -OutFile node.msi ; \
    Start-Process msiexec.exe -ArgumentList '/qn /i node.msi' -NoNewWindow -Wait ; \
    Remove-Item -Force node.msi

# Définir le répertoire de travail
WORKDIR C:/app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers
COPY . .

# Exposer le port (modifie si nécessaire)
EXPOSE 3000

# Lancer l'application
CMD ["node", "index.js"]
