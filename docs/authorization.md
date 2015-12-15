authorization
=============

# Auth process 

This is a multi-step wizard(2 steps, actually) that will generate the *access_token*
needed to sign requests to the dropbox api

## Step 1: Begin authorization

This is the first step in the authorization process. It will basically
generate an url that for the authorization process - user follows url,
it authorizes the application then dropbox will generate an 
authorization code.

		https://www.dropbox.com/1/oauth2/authorize?client_id=<app key>&response_type=code&state=<CSRF token>


## Step 2: Obtain an access token

To convert the authorization code to an access token, call the /token endpoint. Here’s an example of calling this endpoint using curl:

		curl https://api.dropbox.com/1/oauth2/token -d code=<authorization code> -d grant_type=authorization_code -d 		redirect_uri=<redirect URI> -u <app key>:<app secret>
		
The response will look like this:

		{"access_token": "<access token>", "token_type": "Bearer", "uid": "<user ID>"}
		
The access token is all you need to make calls to the Core API.


## Authorization api

This should represent the public api that deals with authorization.

#### ExDropbox.Authorization.authorization_url

Builds an url that will generate the authorization url. This url should be
used by the user in order to authorize the application's access to the 
dropbox api

	ExDropbox.Authorization.authorization_url app_key
	
#### ExDropbox.Authorization.access_token
	
Makes a request to dropbox api in order to obtain an access_token.
This token will be used to sign every request to the api

	ExDropbox.Authorization.access_token auth_token, app_key, app_secret





