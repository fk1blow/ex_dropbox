defmodule ExDropbox.Request do
  def build_params(params \\ %{}) do
    no_ampersand = fn str -> String.slice(str, 0, String.length(str) - 1) end
    to_url_params = fn (x, acc) -> "#{acc}#{elem x, 0}=#{elem x, 1}&" end

    Dict.to_list(params)
    |> List.foldl("?", &(to_url_params.(&1, &2)))
    |> no_ampersand.()
  end

  def auth_header(token \\ %{}) do

  end
end
