defmodule ExDropbox do
  @doc "Retrieves information about the user's account"
  # defdelegate [account_info, account_info(params)], to: ExDropbox.Api.Account, as: :account_info

  @doc "Retrieves file and folder metadata"
  # defdelegate [metadata(path), metadata(path, params)], to: ExDropbox.Api.Metadata, as: :metadata

  @doc "Retrieves metadata about a shared link"
  # defdelegate metadata_link(params), to: ExDropbox.Api.Metadata, as: :metadata_link
end
