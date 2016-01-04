defmodule ExDropbox do
  use KL.Resource
  alias KL.Hostname, as: Host

  headers do
    access_token = Application.get_env :exdropbox, :access_token
    %{"Authorization" => "Bearer #{access_token}"}
  end

  get "account_info", url: "#{Host.api}/account/info"

  get "metadata", url: "#{Host.api}/metadata/auto",
              segment: "path"

  post "metadata_link", url: "#{Host.api}/metadata/link"

  get "files", url: "#{Host.api}/files/auto",
                to: ExDropbox.Api.Filesx,
           segment: ["path"]
end
