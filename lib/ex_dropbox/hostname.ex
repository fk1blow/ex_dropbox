defmodule ExDropbox.Hostname do
  ["api", "content", "notify"] |> Enum.map fn host ->
    def unquote(String.to_atom host)() do
      "https://#{unquote host}.dropboxapi.com/1"
    end
  end
end
