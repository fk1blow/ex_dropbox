defmodule ExDropbox.Api.Metadata do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints
  import ExDropbox.Api.Parser

  # TODO: redefine these fields
  @resource_fields ["a", "b"]

  def metadata(path) do
    get(api_hostname, "/metadata/auto/#{path}") |> to_map @resource_fields
  end

  def metadata(path, params) do
    get(api_hostname, "/metadata/auto/#{path}") |> to_map @resource_fields
  end
end
