defmodule ExDropbox.Hostname do
  ["api", "content", "notify"] |> Enum.map fn name ->
    def unquote(:"#{name}")() do
      "https://#{unquote name}.dropboxapi.com/1"
    end
  end
end
