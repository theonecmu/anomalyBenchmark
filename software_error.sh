#!/bin/bash

mv /var/www/html/PHP/StoriesOfTheDay.php /var/www/html/PHP/in.php
sleep 60
mv /var/www/html/PHP/in.php /var/www/html/PHP/StoriesOfTheDay.php
