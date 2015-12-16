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

  @doc "fetch the user account info"
  defdelegate account_info, to: ExDropbox.Api.Account, as: :account_info
end
