defmodule ExDropbox.Api.Account do
  import ExDropbox.Api.Base
  import ExDropbox.Api.Endpoints
  import ExDropbox.Api.Parser

  @resource_fields [
    "uid", "display_name", "email", "quota_info", "name_details"
  ]

  def account_info(params \\ %{}) do
    # get(api_hostname, "/account/info") |> to_map
    # get(api_hostname, "/account/info") |> to_map @resource_fields
  end
end
