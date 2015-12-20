defmodule ExDropbox.Api.Account do
  use ExDropbox.Resource

  @resource_fields [
    "uid", "display_name", "email", "quota_info", "name_details"
  ]

  def account_info(params \\ %{}) do
    # get(api_hostname, "/account/info") |> to_map
    # get(api_hostname, "/account/info") |> to_map @resource_fields
  end
end
