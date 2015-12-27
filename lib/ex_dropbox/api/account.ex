defmodule ExDropbox.Api.Account do
  use ExDropbox.Resource

  # get "nomadata", params: [list: "false", foo: "2812"], segments: ["path"]

  get "metadata", segments: ["path"]

  get "account_info"
  # get "metadata_link", segments: ["path"], params: %{}

  # resource "metadata" do
    # get "/metadata/auto", segments: ["path"], params: %{}
  # end
end
