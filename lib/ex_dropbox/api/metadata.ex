defmodule ExDropbox.Api.Metadata do
  alias ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints
  alias ExDropbox.Parser
  alias SK.Maybe

  def metadata(path, params \\ %{}) do
    Request.build(api_hostname)
    |> path("/metadata/auto/#{path}")
    |> params(params)
    |> authorization(ExDropbox.Configuration.get[:access_token])
    |> make &Base.get/3


    # ExDropbox.Configuration.get[:access_token]
    # |> check_authorization
    # |> build_request("#{api_hostname}@endpoint/#{path}", params)
  end

  # def metadata(path, params \\ %{}) do
  #   res = Maybe.from(ExDropbox.Configuration.get[:access_token])
  #     |> Maybe.map(&(%{"Authorization" => "Bearer #{&1}"}))
  #     |> Maybe.map(&(Base.get("#{api_hostname}@endpoint/#{path}", params, &1)))
  #     |> Maybe.map(&(Parser.parse_to(&1, ExDropbox.Model.Metadata)))
  #     |> Maybe.or_else(fn val -> {:error, "invalid access token"} end)
  #     |> Maybe.get

  #   # get("#{api_hostname}/metadata/auto/#{path}", params)
  #   # |> parse_to(ExDropbox.Model.Metadata)
  # end

  def metadata_link(params) do
    # get("#{api_hostname}/metadata/link", params)
    # |> parse_to(ExDropbox.Model.MetadataLink)
  end
end
