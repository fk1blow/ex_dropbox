defmodule ExDropbox.Request do
  def get(url, headers) do
    IO.puts "Request.get: " <> url <> " and headers: " <> inspect(headers)
  end
end
