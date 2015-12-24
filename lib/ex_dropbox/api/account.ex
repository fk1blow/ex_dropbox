defmodule ExDropbox.Api.Account do
  # import ExDropbox.Resource

  def account_info(params \\ %{}) do
    # get_resource("/account/info", params) |> model_resource(ExDropbox.Model.Account)
  end

  # import ExDropbox.Api.Base
  # import ExDropbox.Api.Endpoints
  # import ExDropbox.Api.Parser

  # def account_info(params \\ %{}) do
  #   # get(api_hostname, "/account/info", params)

  #   # get(api_hostname, "/account/info", params)
  #   # |> to_map
  #   # |> to_model(ExDropbox.Model.Account)

  #   # get(api_hostname, "/account/info") |> to_map @resource_fields
  # end
end
