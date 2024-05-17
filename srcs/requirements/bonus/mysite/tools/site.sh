#!/bin/bash

mv /mysite /var/www/html/
cd /var/www/html/mysite
exec python3 -m http.server