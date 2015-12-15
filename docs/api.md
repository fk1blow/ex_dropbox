Dropbox API
===========

# components

  - Configuration
  - Authorization
  - Request

## configuration

Deals with initial configuration of the api by providing the
"api_key" and "api_secret" of the dropbox app.
It also holds the "access_token" for further requests throught 
its lifecycle.

## authorization

Deals with authrorization process required by dropbox - Oauth2
It generates the urls for the complete round-trip.

## request

Builds actual requests to the dropbox api
Needs the auth token in order to properly function

# authorization process

the authorization process is a multi-step...

## step 1 - obtain authorization code 

Ask the user to follow an url that will generate the authorization
code needed to obtain the access token

## step 2 - obtain access token

Obtain the access token in order to sign requests being made to the 
dropbox api


