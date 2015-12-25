defmodule ExDropbox.Api.Endpoints do
  @moduledoc """
    Builds and exposes a set of functions which will compose the
    endpoints for the various hostnames of dropbox api
  """
  ["api", "content", "notify"] |> Enum.each fn(host) ->
    def unquote(:"#{host}_hostname")() do
      "https://#{unquote(host)}.dropboxapi.com/1"
    end
  end
end
