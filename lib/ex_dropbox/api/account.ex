defmodule ExDropbox.Api.Account do
  use ExDropbox.Resource

  get "nomadata", segments: ["path"], params: [list: "false", foo: "2812"]
  # get "metadata", params: %{}
  # get "metadata_link", segments: ["path"], params: %{}

  # resource "metadata" do
    # get "/metadata/auto", segments: ["path"], params: %{}
  # end
end
