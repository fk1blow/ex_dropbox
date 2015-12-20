defmodule ExDropbox.Api.Metadata do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints
  import ExDropbox.Api.Parser

  def metadata do
    IO.inspect "metadata/0"
  end

  def metadata(path, params) when :erlang.is_map(params) do
    IO.inspect "metadata/2"
    IO.inspect path
    IO.inspect params
  end

  def metadata(params) when :erlang.is_map(params) do
    IO.inspect "metadata/1 is map"
    IO.inspect params
  end

  def metadata(path) when is_bitstring(path) do
    IO.inspect "metadata/1 is string"
    IO.inspect path
  end
end
