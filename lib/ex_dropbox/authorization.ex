defmodule ExDropbox.Authorization do
  @auth_endpoint "https://www.dropbox.com/1/oauth2/authorize"

  def authorization_url(app_key) do
    case app_key do
      key when is_bitstring key ->
        {:ok, _authorization_url key}
      _ ->
        {:error, "invalid app_key given"}
    end
  end

  def get_access_token(auth_token, app_key, app_secret) do
    IO.puts "should obtain the access_token"
  end

  def revoke_access_token do
    IO.puts "should revoke the access token"
  end

  defp _authorization_url(app_key) do
    csrf = SecureRandom.urlsafe_base64
    @auth_endpoint <> "?client_id=#{app_key}&response_type=code&state=#{csrf}"
  end
end
