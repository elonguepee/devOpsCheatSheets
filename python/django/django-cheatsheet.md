# Django Cheatsheet
## A cheatsheet for Django concepts

### Project File Structure
#### Pipfile
Pipfile is like package.json for django. It has packages, dependancies, versions, etc.

#### __init__.py
Defines the core directory as a package

#### settings.py
Defines application settings. Contains:
- INSTALLED_APPS: The apps that are installed in django. Such as the admin app: **django.contrib.admin**, auth app: **django.contrib.auth**, etc.

#### urls.py
Defines the Urls of application

#### manage.py
A wrapper for django-admin. manage.py takes into account the settings for the project as opposed to django-admin that is more general and does not.

### App File Structure
#### Migrations folder
For generating database tables

#### admin.py
Determines what the admin interface for the app is going to look like

#### apps.py
For configuring the app

#### models.py
Define Model classes for the app. To pull out data from the database.

#### tests.py
For unit tests

#### views.py
Essentially request handlers

### Commands
```bash
pipenv install django
```
Installs django and creates a virtual environment

```bash
pipenv shell
```
Activates the virtual environment using the interpreter in the virtual environment

```bash
pipenv --venv
```
Get's the path to the virtual environment's interpreter

```bash
django-admin startproject <project_name> <project_directory_optional>
``` 
starts a new project

```bash
python manage.py runserver <port>
```
Runs the server on the specified port. 8000 is the default if port is not specified.

```bash
python manage.py startapp <app_name>
```
Creates an app

### Concepts
#### Creating an app
To create an app, run the startapp command, then add it to the INSTALLED_APPS list in the project's settings.py