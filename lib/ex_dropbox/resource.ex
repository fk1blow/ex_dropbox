defmodule ExDropbox.Resource do
  alias ExDropbox.Fetch

  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  # defmacro get(name, handler, meta) do
  #   {module, _} = Code.eval_quoted(handler)
  #   module.foo()
  # end

  @doc """
    GET action definition
    It creates the action function, named `resource_name/2` that will eventually
    call HTTPoison.get function
  """
  defmacro get(name, meta), do: compile_get {name, meta}

  @doc """
    POST action definition
    It creates the action function, named `resource_name/2` that will eventually
    call HTTPoison.post function
  """
  defmacro post(name, meta), do: compile_post {name, meta}

  # TODO: move this inside some other module
  defp authorization_headers(meta) do
    es = Application.get_env(:ex_dropbox, :authorize_resource)
    ms = meta[:options][:signed]
    headers = %{}
    # if none of the two are true, or one of them is true, sign request
    if ms == true || (es == true && ms == nil) || (es == nil && ms == nil) do
      headers = %{"Authorization" => "Bearer 234831yhdaasb12asdh3248f"}
    end
    headers
  end

  @doc """
    This area becomes private
  """

  # defp compile(method_type, [resource_name: name, resource_meta: meta]) do
  #   case method_type do
  #     :get  -> compile_get resource_name: name, resource_meta: meta
  #     :post -> compile_post resource_name: name, resource_meta: meta
  #   end
  # end

  defp compile_get([resource_name: name, resource_meta: meta]) do
    unless meta[:url] do
      raise ":url, the url/endpoint of the resource, should always be defined"
    end

    {callback, _} = Code.eval_quoted(meta[:to])

    IO.inspect callback

    headers = Macro.escape(authorization_headers(meta))

    if meta[:segment] do
      quote do
        def unquote(:"#{name}")(segment, params \\ %{}) do
          Fetch.get(unquote(meta[:url]) <> segment, unquote(headers), params)
        end
      end
    else
      quote do
        def unquote(:"#{name}")(params \\ %{}) do
          Fetch.get(unquote(meta[:url]), unquote(headers), params)
        end
      end
    end

    #
  end

  def compile_post([resource_name: name, resource_meta: meta]) do
    unless meta[:url] do
      raise ":url, the url/endpoint of the resource, should always be defined"
    end

    IO.puts "should define the post requests"
  end
end
