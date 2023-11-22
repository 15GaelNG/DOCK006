$ git clone http://git.consorcionova.com:7990/scm/wac/rg.git rg  
$ composer install/update
$ php artisan key:generate
$ php artisan migrate --seed
$ php artisan storage:link
$ php artisan optimize:clear
$ composer dump-autoload
$ sudo chmod -R 775 vendor
$ sudo chmod -R 775 public
$ sudo chmod -R 775 storage
$ sudo chown -R www-data:www-data rg


<!-- ### Built with :hammer:
* PHP 7.2.5
* Laravel 7.0
* Bootstrap 4.5.3
* SweetAlert
* Jquery 3.5
* Jquery UI 1.12
* Postgresql 
* Carbon 
* Datatables  -->
