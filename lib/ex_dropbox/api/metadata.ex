defmodule ExDropbox.Api.Metadata do
  use ExDropbox.Resource

  get "metadata", from: "api.dropboxapi.com/1/metadata/auto/", segment: "path"

  post "metadata_link", to: "https://api.dropbox.com/1/metadata/link"
end
