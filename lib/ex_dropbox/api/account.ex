defmodule ExDropbox.Api.Account do
  use ExDropbox.Resource

  get "account_info", from: "api.dropboxapi.com/1/account/info"
end
