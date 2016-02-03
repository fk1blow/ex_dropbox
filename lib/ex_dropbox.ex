defmodule ExDropbox do
  use KL.Resource
  alias KL.Hostname, as: Host

  headers do
    access_token = Application.get_env :exdropbox, :access_token
    %{"Authorization" => "Bearer #{access_token}"}
  end

  get "account_info", url: "#{Host.api}/account/info"

  get "files", url: "#{Host.content}/files/auto"

  post "files_put", url: "#{Host.content}/files_put/auto/"

  get "metadata", url: "#{Host.api}/metadata/auto"

  post "metadata_link", url: "#{Host.api}/metadata/link"

  post "delta", url: "#{Host.api}/delta"

  get "revisions", url: "#{Host.api}/revisions/auto"

  get "restore", url: "#{Host.api}/revisions/restore/auto"

  get "search", url: "#{Host.api}/search/auto"

  post "shares", url: "#{Host.api}/shares/auto"

  post "media", url: "#{Host.api}/media/auto"

  get "copy_ref", url: "#{Host.api}/copy_ref/auto"

  get "thumbnails", url: "#{Host.content}/thumbnails/auto"

  get "previews", url: "#{Host.content}/previews/auto"

  post "save_url", url: "#{Host.api}/save_url/auto"

  get "save_url_job", url: "#{Host.api}/save_url_job/auto"
end
