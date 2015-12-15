defmodule ExDropbox.Configuration do
  def configure(auth) do
    Application.put_env :ex_dropbox, :auth, auth
  end

  def configuration do
    Application.get_env :ex_dropbox, :auth
  end
end
