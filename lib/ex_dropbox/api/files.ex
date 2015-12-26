defmodule ExDropbox.Api.Files do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints
  import ExDropbox.Parser

  def files(path, params \\ %{}) do
    get("#{content_hostname}/files/auto/#{path}", params)
  end

  def files_puts(path, param) do
    raise "not implemented"
  end
end
