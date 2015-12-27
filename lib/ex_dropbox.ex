defmodule ExDropbox do
  @doc """
    Fuck this! Buid a proper way to handle a token. This api will need to
    deal with more than one user at a time.

    TODO: build a proper Configuration module that can handle multiple accounts
  """
  @doc "set the configuration of the api"
  defdelegate configure(auth), to: ExDropbox.Configuration, as: :set

  @doc "fetch the configuration(although redundant and not DRY)"
  defdelegate configuration, to: ExDropbox.Configuration, as: :get

  @moduledoc """
    Dropbox api functions, listed in the same
    order as https://www.dropbox.com/developers-v1/core/docs
  """
  @doc "Retrieves information about the user's account"
  defdelegate [account_info, account_info(params)], to: ExDropbox.Api.Account, as: :account_info

  @doc "Retrieves file and folder metadata"
  defdelegate [metadata(path), metadata(path, params)], to: ExDropbox.Api.Metadata, as: :metadata

  @doc "Retrieves metadata about a shared link"
  defdelegate metadata_link(params), to: ExDropbox.Api.Metadata, as: :metadata_link
end
