defmodule ExDropbox.Api.Metadata do
  import ExDropbox.Api.Endpoints
  import ExDropbox.Parser
  import ExDropbox.Request

  def metadata(path, params \\ %{}) do
    base_url(api_hostname)
    |> path("/metadata/auto/#{path}")
    |> params(params)
    |> authorization(ExDropbox.Configuration.get[:access_token])
    |> perform_with(&ExDropbox.Api.Base.get/2)
    |> parse_to(ExDropbox.Model.Metadata)
  end

  def metadata_link(params) do
    # get("#{api_hostname}/metadata/link", params)
    # |> parse_to(ExDropbox.Model.MetadataLink)
  end
end
