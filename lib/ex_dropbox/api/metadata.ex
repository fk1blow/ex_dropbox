defmodule ExDropbox.Api.Metadata do
  use ExDropbox.NewResource

  resource "metadata", do: [
    :with_segment,
    :with_path,
    endpoint: "/metadata/auto",
  ]



  # try #3

  # def metadata do
  #   IO.inspect "metadata/0"
  # end

  # def metadata(path, params) when :erlang.is_map(params) do
  #   IO.inspect "metadata/2"
  #   IO.inspect path
  #   IO.inspect params
  # end

  # def metadata(params) when :erlang.is_map(params) do
  #   IO.inspect "metadata/1 is map"
  #   IO.inspect params
  # end

  # def metadata(path) when is_bitstring(path) do
  #   IO.inspect "metadata/1 is string"
  #   IO.inspect path
  # end





  # try #2

  # use ExDropbox.NewResource

  # resource :metadata do

  # end




  # try #1

  # import ExDropbox.Api.Base
  # import ExDropbox.Api.Endpoints
  # import ExDropbox.Api.Parser

  # # TODO: redefine these fields
  # @resource_fields ["a", "b"]

  # def metadata(path) do
  #   get(api_hostname, "/metadata/auto/#{path}") |> to_map @resource_fields
  # end

  # def metadata(path, params) do
  #   get(api_hostname, "/metadata/auto/#{path}") |> to_map @resource_fields
  # end

  # def metadata_link(path, params) do
  #   raise "not implemented"
  # end
end
