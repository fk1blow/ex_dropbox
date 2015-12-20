defmodule ExDropbox.Api.Metadata do
  use ExDropbox.Resource

  resource "metadata", do: [host: "api", url_path: "/metadata/auto"]

  resource "metadata_link", do: [host: "api", url_path: "/metadata/link"]

  # def metadata_link do
  #   raise "not implemented"
  # end


  #
  # v1
  #

  # @resource_fields ["contents"]

  # def metadata(path \\ "/", params \\ %{}) do
  #   get(api_hostname, "/metadata/auto/#{path}") |> to_map @resource_fields
  # end

  # def metadata_link do
  #   raise "not implemented"
  # end
end
