defmodule ExDropbox.Resource do
  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  @doc """
    It defines a function that generates an expression which
    will call a Base.get/2 request
  """
  defmacro get(resource, meta) do
    unless meta[:from] do
      # I do not know how to deal with this stuff. You can just let the code
      # work but it will thow at runtime, because the url won't be valid
      raise "unable to generate a resource without an endpoint"
    end

    if meta[:segment] do
      quote do
        @doc """
          get with a segment and params - function/2
        """
        def unquote(String.to_atom(resource))(segment, params \\ %{}) do
          "get(#{unquote(meta[:from])}, #{segment}, #{inspect(params)}})"
        end
      end
    else
      quote do
        @doc """
          get with just params - function/1
        """
        def unquote(String.to_atom(resource))(params \\ %{}) do
          "get(#{unquote(meta[:from])}, params)"
        end
      end
    end
  end

  @doc """
    TBD
  """
  defmacro post(resource, meta) do
    IO.puts "`post` macro not implemented"
  end
end
