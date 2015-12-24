defmodule ExDropbox.Api.Metadata do
  # try to inject Endpoints inside Api.Base ???
  # import ExDropbox.Api.Endpoints
  import ExDropbox.Api.Base
  import ExDropbox.Parser

  def metadata(path, params \\ %{}) do
    get("#{api_hostname}/metadata/auto/#{path}", params)
    |> parse(ExDropbox.Model.Metadata)
  end
end
