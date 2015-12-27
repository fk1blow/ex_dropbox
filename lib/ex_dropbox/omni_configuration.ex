defmodule ExDropbox.OmniConfiguration do
  use GenServer

  # client module

  # def start_link(api_key, api_secret, access_token) do
  def start_link(config) do
    # IO.inspect auth
    # config = {api_key, api_secret, access_token}
    :gen_server.start_link {:local, :configuration}, __MODULE__, config, []
  end

  def get_configuration do
    :gen_server.call :configuration, :get
  end

  def add_access_token(token) do
    :gen_server.call :configuration, {:add_access_token, token}
  end

  # callbacks module

  def init(config) do
    {:ok, config}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  # TODO: somehow i think it won't be a need for this function because the
  # access_token will/should be added on `start_link`
  def handle_call(:add_access_token, _from, state) do
    {:reply, state, state}
  end

  def handle_call(_, _from, _state) do
    {:reply, :error, []}
  end
end
