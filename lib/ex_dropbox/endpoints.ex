defmodule ExDropbox.Api.Endpoints do
  @dropbox_api_version 1

  @dropbox_api_hostnames [
    api: "api.dropboxapi.com",
    content: "content.dropboxapi.com",
    notify: "notify.dropbox.com"
  ]

  def api_hostname do
    "https://#{@dropbox_api_hostnames[:api]}/#{@dropbox_api_version}"
  end

  def content_hostname do
    "https://#{@dropbox_api_hostnames[:content]}/#{@dropbox_api_version}"
  end

  def notify_hostname do
    "https://#{@dropbox_api_hostnames[:notify]}/#{@dropbox_api_version}"
  end
end
