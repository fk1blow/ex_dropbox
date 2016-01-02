defmodule ExDropbox do
  use KL.Resource

  headers do
    access_token = Application.get_env :exdropbox, :access_token
    %{"Authorization" => "Bearer #{access_token}"}
  end

  get "account_info", url: "https://api.dropboxapi.com/1/account/info"

  get "metadata", url: "api.dropboxapi.com/1/metadata/auto/",
              segment: "path"

  post "metadata_link", url: "https://api.dropbox.com/1/metadata/link"

  get "files", url: "https://content.dropboxapi.com/1/files/auto",
                to: ExDropbox.Api.Filesx,
           segment: ["path"]
end
