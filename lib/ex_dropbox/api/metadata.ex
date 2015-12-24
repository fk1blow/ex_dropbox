defmodule ExDropbox.Api.Metadata do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints
  import ExDropbox.Parser

  def metadata(path, params \\ %{}) do
    get("#{api_hostname}/metadata/auto/#{path}", params)
    |> parse_to(ExDropbox.Model.Metadata)
  end
end
