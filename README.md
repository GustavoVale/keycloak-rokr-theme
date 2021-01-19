# keycloak-rokr-theme

In this project we define a few steps to make a Keycloak theme working on the keycloak login page.

There are X main steps defined below.

## 1) Setting the Infrastructure Up

To create the containers (postgres and keycloak) go to the terminal in the root of this project and type:

```
        docker-compose -f docker-compose.yml up
```

After it is created go to ``localhost:8088``. Then, click in the "_Administration Console_" and type the username and password below

```
        username: admin
        Password: testing
```

## 2) Creating a Realm and User. 

### Creating a realm
    
On the left-top hover _Master_ and click on the button ***"Add realm"***. In the new tab, write the name of the realm (e.g., rokr-theme-test) and press ***"Create"***.

### Creating a user
Click on ***"Users"*** on the left and in the opened tab, click ***"Add user"***. After, defined an "Username" (e.g., user1) and click ***"Save"***. Once the user is created, go to the "_Credentials_" tab and define a password (e.g., user). At the end, press "_Reset Password_"

## 3) Changing the theme

On the left side, click on ***"Realm Settings"***. Then click on "_Themes_" tab and in the "Login Theme" choose "rokr-theme" and press ***"Save"***.

## 4) Accessing the Login Page

The following link redirects to the admin console: http://localhost:8088/auth/realms/master/protocol/openid-connect/auth?client_id=security-admin-console&redirect_uri=http%3A%2F%2Flocalhost%3A8088%2Fauth%2Fadmin%2Fmaster%2Fconsole%2F

If you define the realm name as "rokr-theme-test", the following link redirects to the user console: http://localhost:8088/auth/realms/rokr-theme-test/account/. Otherwise, just change "rokr-theme-test" in this url to the realm name you gave.

# OBS: To See Changes Without Restarting the Keycloak Server you need to disable caching.

For that you need to login in the "_keycloak_rokr-theme-keycloak_1 container"_ and change the standalone.xml file. This file is located at

```
./standalone/configuration/standalone.xml
```

Make the following changes to standalone.

```
<theme>
    <staticMaxAge>-1</staticMaxAge>
    <cacheThemes>false</cacheThemes>
    <cacheTemplates>false</cacheTemplates>
    ...
</theme>
```
