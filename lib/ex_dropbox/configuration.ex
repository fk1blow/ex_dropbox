defmodule ExDropbox.Configuration do
  def set(auth) do
    Application.put_env :ex_dropbox, :auth, auth
  end

  def get do
    Application.get_env :ex_dropbox, :auth
  end
end
