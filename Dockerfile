# Use the official PHP image
FROM php:8.1-apache

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libpq-dev \
    libfreetype6-dev \
    libonig-dev \
    locales \
    zip \
    unzip \
    vim \
    git \
    curl \
    postgresql-client

### Install any needed packages
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY . /var/www/html

RUN docker-php-ext-install pdo_mysql pdo_pgsql zip exif gd

# Enable Apache modules
RUN a2enmod rewrite

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring

# Configuración adicional para corregir el error "Forbidden"
COPY php_configs /var/www/html

#-------------------------
#*** START THE PROJECT ***
#-------------------------

ARG TOKEN
ENV TOKEN=${TOKEN}

WORKDIR /var/www/html

#Clone repository
RUN git clone https://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@github.com/Raloy-Lubricantes-S-A-de-C-V/DEV006 /var/www/html/reporte_financiero_dev
# Cambios para dar permisos de escritura
RUN chmod -R 755 reporte_financiero_dev
RUN chown -R www-data:www-data /var/www/html/reporte_financiero_dev

COPY .env /var/www/html/reporte_financiero_dev

WORKDIR /var/www/html/reporte_financiero_dev

# Copia el archivo de configuración de Apache
COPY php_configs /var/www/html/reporte_financiero_dev
COPY server.php /var/www/html/reporte_financiero_dev
COPY entrypoint.sh /var/www/html/reporte_financiero_dev
RUN chmod +x /var/www/html/reporte_financiero_dev/entrypoint.sh
ENTRYPOINT ["/var/www/html/reporte_financiero_dev/entrypoint.sh"]