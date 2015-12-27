defmodule ExDropbox.Api.Account do
  use ExDropbox.Resource

  resource "account_info" do
    [
      endpoint: "https://api.dropboxapi.com/v1",
      path: "/account/info",
      type: "get"
    ]
  end
end
