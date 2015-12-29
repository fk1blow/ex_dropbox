defmodule ExDropbox do
  use ExDropbox.Resource

  get "account_info", url: "api.dropboxapi.com/1/account/info"

  get "metadata", url: "api.dropboxapi.com/1/metadata/auto/",
              segment: "path",
              options: [signed: false]

  post "metadata_link", url: "https://api.dropbox.com/1/metadata/link"
end
