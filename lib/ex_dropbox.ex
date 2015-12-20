defmodule ExDropbox do
  @moduledoc """
    Client api for Dropbox
  """

  @doc "set the configuration of the api"
  defdelegate configure(auth), to: ExDropbox.Configuration, as: :set

  @doc "fetch the configuration(although redundant and not DRY)"
  defdelegate configuration, to: ExDropbox.Configuration, as: :get

  @moduledoc """
    Dropbox api functions, listed in the same
    order as https://www.dropbox.com/developers-v1/core/docs

    TODO: should i add the authorize functions? do i really need them?
  """

  @doc "Retrieves information about the user's account"
  defdelegate account_info, to: ExDropbox.Api.Account, as: :account_info

  @doc "Downloads a file"
  defdelegate files, to: ExDropbox.Api.Files, as: :files

  @doc "Retrieves file and folder metadata"
  defdelegate metadata to: ExDropbox.Api.Metadata, as: :metadata
  defdelegate metadata(path), to: ExDropbox.Api.Metadata, as: :metadata
  defdelegate metadata(params), to: ExDropbox.Api.Metadata, as: :metadata
  defdelegate metadata(path, params), to: ExDropbox.Api.Metadata, as: :metadata

  @doc "Retrieves metadata about a shared link"
  defdelegate metadata_link(params), to: ExDropbox.Api.Metadata, as: :metadata_link
end
