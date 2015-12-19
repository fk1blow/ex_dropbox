defmodule ExDropbox.Api.Endpoints do
  @moduledoc """
    Exposes a set of function, to retrieve the endpoints for
    the various hostnames that dropbox api exposes
  """
  ["api", "content", "notify"] |> Enum.each fn(host) ->
    def unquote(:"#{host}_hostname")() do
      "https://#{unquote(host)}.dropboxapi.com/1"
    end
  end
end
