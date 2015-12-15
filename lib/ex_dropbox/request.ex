defmodule ExDropbox.Request do
  def get(url, headers \\ %{}) do
    res = HTTPoison.get!(url, headers)
    res.body
  end
end
