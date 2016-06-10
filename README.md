# Contacts Custom Fields

__Contacts Custom Fields__ is a Ruby on Rails application that implements user authentication with [Devise] and custom fields for contacts with PostgreSQL [hstore].

You can check the application running at https://leonam-resultadosdigitais.herokuapp.com/.

### Installation

__Contacts Custom Fields__ requires PostgreSQL, since __hstore__ is used to keep custom fields data. You can find how to install PostgreSQL [here](https://www.postgresql.org/download/linux/ubuntu/).

You can download from [GitHub] or clone it. 
```sh
$ git clone https://github.com/LeonamAnjos/contacts_custom_fields.git
```

After you need to install the required _gems_:
```sh
$ cd contacts_custom_fields
$ bundle install
```
The database connection configuration is settled to get _user / password / host_ from environment variables _$USERNAME / $PASSWORD / $IP_. You can change in _/config/database.yml_ or prepare the environment.
```sh
$ echo "export USERNAME=user" >> ~/.profile
$ echo "export PASSWORD=password" >> ~/.profilePostgreSQ 
$ echo "export IP=localhost" >> ~/.profile
$ source ~/.profile
```
Create the database and prepare it with rake:
```sh
$ rake db:create
$ rake db:migrate
```
__Hstore__ requires installing a extension that depends on additional modules. If you get error running _"rake db:migrate"_ you can try install the "postgresql-contrib" before running again. If you are using PostgreSQL 9.3:
```sh
$ sudo apt-get update
$ sudo apt-get install postgresql-contrib-9.3
```

[GitHub]: <https://github.com/LeonamAnjos/contacts_custom_fields>
[Devise]: <https://github.com/plataformatec/devise>
[hstore]: <https://www.postgresql.org/docs/9.1/static/hstore.html>
   