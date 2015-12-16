defmodule ExDropbox.Api.Account do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints

  # use ExDropbox.Api.Resourceable

  def get_account_info do
    # get "http://localhost:9000", "/account/info"
    get api_hostname, "/account/info"
  end

  def handle_account_info(info) do
    #
  end
end
