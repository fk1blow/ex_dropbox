defmodule ExDropbox.Api.Metadata do
  use ExDropbox.Api.Base

  def metadata(path, params \\ %{}) do
    get("#{api_hostname}/metadata/auto/#{path}", params)
    |> parse_to(ExDropbox.Model.Metadata)
  end
end
