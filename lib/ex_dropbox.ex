defmodule ExDropbox do
  @moduledoc """
    Client api for Dropbox
  """

  @doc "it sets the configuration of the api - api_key, api_secret, access_token"
  defdelegate configure(auth), to: ExDropbox.Configuration, as: :configure

  @doc "it fetches the configuration(although redundant and not DRY)"
  defdelegate configuration, to: ExDropbox.Configuration, as: :configuration
end
