defmodule ExDropbox.NewResource do
  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Api.Base
      import ExDropbox.Api.Endpoints
      import ExDropbox.NewResource
      # require ExDropbox.NewResource
    end
  end

  defmacro resource(name, do: block) do
    import ExDropbox.Api.Endpoints
    import ExDropbox.Api.Base
    function_name = String.to_atom(name)

    case block do
      [:with_segment, :with_path, endpoint: endpoint] ->
        quote do
          def unquote(function_name)() do
            unquote(:"#api_hostname"))()
            # get(apply(ExDropbox.Api.Endpoints, unquote(:"#{name}_hostname")),
            #   "#{unquote(endpoint)}#{path}")
          end
        end
    end



  end

  defp generate_resource(what) do
    IO.inspect "generate_resource"
    IO.inspect what


  end
end
