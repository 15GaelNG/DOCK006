#!/bin/sh

# Instala las dependencias de Composer
composer install
composer update

php artisan serve --host=0.0.0.0 --port=80

# Genera la clave de Laravel
php artisan key:generate

php artisan route:cache
php artisan route:clear
php artisan config:clear
php artisan optimize
php artisan storage:link

# Mantén el script en ejecución
tail -f /dev/null

