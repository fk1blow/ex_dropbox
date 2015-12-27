defmodule ExDropbox.Resource do
  import ExDropbox.Request

  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  @doc """
    It defines a function that generates an expression which
    will call a Base.get/2 request
  """
  defmacro get(name, meta) do
    compile :get, resource_name: name, resource_meta: meta
  end

  defmacro post(name, meta) do
    raise "unimplemented"
  end

  @doc """
    TBD
  """
  defmacro post(resource, meta) do
    IO.puts "`post` macro not implemented"
  end

  @doc """
    This area becomes private
  """

  defp compile(method_type, [resource_name: name, resource_meta: meta]) do
    IO.puts "compile:"
    IO.inspect method_type
    IO.inspect name
    IO.inspect meta

    case method_type do
      :get  -> compile_get resource_name: name, resource_meta: meta
      :post -> raise "not implemented"
      _     -> raise "possible invalid method_type, when trying to compile resource method"
    end
  end

  defp compile_get([resource_name: name, resource_meta: meta]) do
    IO.puts "compile_get:"
    IO.inspect name
    IO.inspect meta

    unless meta[:from] do
      raise ":from, the url/endpoint of the resource, should always be defined"
    end

    quote do
      def unquote(:"#{name}")() do
        get("/some/url", %{})
      end
    end
  end
end
