defmodule ExDropbox.Request do
  def do_get(url, headers) do
    IO.puts "Request.get: " <> url <> " and headers: " <> inspect(headers)
  end
end
