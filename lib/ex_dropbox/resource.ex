defmodule ExDropbox.Resource do
  alias ExDropbox.Fetch

  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  @doc """
    It defines a function that generates an expression which
    will eventually call a ExDropbox.Fetch.get/2 request
  """
  defmacro get(name, meta) do
    compile :get, [resource_name: name, resource_meta: meta]
  end

  @doc """
    It defines a function that generates an expression which
    will eventually call a ExDropbox.Fetch.post/2 request
  """
  defmacro post(name, meta) do
    compile :post, resource_name: name, resource_meta: meta
  end

  @doc """
    This area becomes private
  """

  defp compile(method_type, [resource_name: name, resource_meta: meta]) do
    case method_type do
      :get  -> compile_get resource_name: name, resource_meta: meta
      :post -> compile_post resource_name: name, resource_meta: meta
    end
  end

  defp compile_get([resource_name: name, resource_meta: meta]) do
    unless meta[:from] do
      raise ":from, the url/endpoint of the resource, should always be defined"
    end

    # # dunno a better way to dynamically define functions...
    if meta[:segment] do
      quote do
        def unquote(:"#{name}")(segment, params \\ %{}) do
          es = Application.get_env(:ex_dropbox, :authorize_resource)
          ms = unquote(meta[:options][:signed])

          # if none of the two are true, or one of them is true, sign request
          if ms == true || (es == true && ms == nil) || (es == nil && ms == nil) do
            headers = %{"Authorization" => "Bearer 234831yhdaasb12asdh3248f"}
          end

          # compose the url from the meta[:from] plus segment plus params(as query string)
          Fetch.get(unquote(meta[:from]) <> segment, headers || %{}, params)
        end
      end
    else
      quote do
        def unquote(:"#{name}")(params \\ %{}) do
          Fetch.get(unquote(meta[:from]), params)
        end
      end
    end

    #
  end

  def compile_post([resource_name: name, resource_meta: meta]) do
    unless meta[:to] do
      raise ":to, the url/endpoint of the resource, should always be defined"
    end

    IO.puts "should define the post requests"
  end
end
