defmodule ExDropbox.Api.Files do
  use ExDropbox.Resource

  # TODO: add 'revision' param
  def files(path \\ "/") do
    raise "not implemented"
  end

  def files_puts(file_path, param) do
    raise "not implemented"
  end
end