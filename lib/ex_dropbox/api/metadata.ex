defmodule ExDropbox.Api.Metadata do
  use ExDropbox.Resource

  get "metadata", endpoint: "api.dropboxapi.com/1/metadata/auto",
                  segment: "path"
end
