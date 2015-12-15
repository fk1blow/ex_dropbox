defmodule ExDropbox.Api.Account do
  import ExDropbox.Api.Base
  # import ExDropbox.Request

  # alias ExDropbox.Endpoints, as: Endpoints
  # alias ExDropbox.Configuration, as: Configuration

  # TODO: move the acces token and headers inside the ExDropbox.Api.base
  # and ofcourse, import it!

  @resource_path "/account/info"

  def account_info do
    get @resource_path
  end

  # def account_info do
  #   # not the Account's concern to handle/get the access_token
  #   # another module should handle this
  #   access_token = Configuration.get[:access_token]

  #   # the Authorization header needs to be automatically inserted for each
  #   # 'signed' request to be made
  #   headers = %{"Authorization" => "Bearer #{access_token}"}

  #   # because it was imported, you can use it like in the line below
  #   # get("#{Endpoints.api}#{@url_resource}", headers)
  #   ExDropbox.Request.get("#{Endpoints.api}#{@resource_path}", headers)
  # end
end
