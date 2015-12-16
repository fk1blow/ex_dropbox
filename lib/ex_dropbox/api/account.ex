defmodule ExDropbox.Api.Account do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints

  def account_info do
    # get "http://localhost:9000", "/account/info"
    get api_hostname, "/account/info"
  end
end
