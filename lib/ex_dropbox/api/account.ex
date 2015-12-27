defmodule ExDropbox.Api.Account do
  use ExDropbox.Resource

  get "account_info", endpoint: "api.dropboxapi.com/1/account/info"
end
