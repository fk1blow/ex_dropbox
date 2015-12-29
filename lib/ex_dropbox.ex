defmodule ExDropbox do
  use ExDropbox.Resource

  get "account_info", from: "api.dropboxapi.com/1/account/info"

  get "metadata", from: "api.dropboxapi.com/1/metadata/auto/",
               segment: "path",
               options: [signed: false]

  post "metadata_link", to: "https://api.dropbox.com/1/metadata/link"

  @doc "Retrieves information about the user's account"
  # defdelegate [account_info, account_info(params)], to: ExDropbox.Api.Account, as: :account_info

  @doc "Retrieves file and folder metadata"
  # defdelegate [metadata(path), metadata(path, params)], to: ExDropbox.Api.Metadata, as: :metadata

  @doc "Retrieves metadata about a shared link"
  # defdelegate metadata_link(params), to: ExDropbox.Api.Metadata, as: :metadata_link
end
