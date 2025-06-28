# Usar a imagem do Nginx
FROM nginx:alpine

# Remover a configuração padrão do Nginx
RUN rm /usr/share/nginx/html/*

# Copiar a configuração personalizada do Nginx
COPY nginx.conf /etc/nginx/conf.d/

# Copiar os arquivos do build para o diretório do Nginx
COPY build/web /usr/share/nginx/html

# Expor a porta 80
EXPOSE 443

# Iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
