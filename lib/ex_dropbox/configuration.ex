defmodule ExDropbox.Configuration do
  @moduledoc """
    Manages the configuration of the app(although, using the env)
    In the future, you might consider having multiple clients,
    hence multiple configurations for each of them.
  """

  def set(auth) do
    Application.put_env :ex_dropbox, :auth, auth
  end

  def get do
    Application.get_env :ex_dropbox, :auth
  end
end
