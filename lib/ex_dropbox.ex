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
  """

  @doc "Retrieves information about the user's account"
  defdelegate [account_info, account_info(params)], to: ExDropbox.Api.Account, as: :account_info

  @doc """
    Downloads a file. Note that this call goes to content.dropboxapi.com
    instead of api.dropboxapi.com.
  """
  defdelegate files, to: ExDropbox.Api.Files, as: :files

  @doc """
    Uploads a file using PUT semantics. Note that this call goes to
    content.dropboxapi.com instead of api.dropboxapi.com.

    The preferred HTTP method for this call is PUT. For compatibility
    with browser environments, the POST HTTP method is also recognized.

    Note: Providing a Content-Length header set to the size of the uploaded
    file is required so that the server can verify that it has received the
    entire file contents.

    ## PARAMETERS

    `locale`
    `overwrite`
    `parent_rev`
    `autorename`
  """
  defdelegate files_put, to: ExDropbox.Api.Files, as: :files_put

  @doc "Retrieves file and folder metadata"
  defdelegate [metadata(path), metadata(path, params)], to: ExDropbox.Api.Metadata, as: :metadata

  @doc "Retrieves metadata about a shared link"
  defdelegate metadata_link(params), to: ExDropbox.Api.Metadata, as: :metadata_link
end
