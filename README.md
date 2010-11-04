GrokFolio
=========

GrokFolio is my personal portfolio that can be found at http://rapin.com

Feel free to download and customize for your own purposes. However, please leave a link to this repository.

Installation
------------

You will need to copy and modify a few files to get started:

* cp config/app_config.yml.sample config/app_config.yml
* cp config/database.yml.sample config/database.yml
* cp config/deploy.rb.sample config/deploy.rb
* cp config/initializers/session_store.rb.sample config/initializers/session_store.rb
* cp db/seeds.rb.sample db/seeds.rb

After copying the above files, you will need to edit them to your personal tastes. Then...

* rake db:create
* rake db:migrate
* rake db:seed
* ./script/server

And give it a whirl.