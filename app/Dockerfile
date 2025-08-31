FROM nginx:1.27-alpine

# Remove arquivos padrão do Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia os arquivos estáticos para o diretório padrão do Nginx
COPY html /usr/share/nginx/html

# Expondo a porta padrão do Nginx
EXPOSE 80

# Comando padrão do Nginx
CMD ["nginx", "-g", "daemon off;"]
