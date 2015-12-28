defmodule ExDropbox.Resource do
  import ExDropbox.Request

  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  @doc """
    It defines a function that generates an expression which
    will eventually call a Base.get/2 request
  """
  defmacro get(name, meta) do
    compile :get, [resource_name: name, resource_meta: meta]
  end

  @doc """
    It defines a function that generates an expression which
    will eventually call a Base.post/2 request
  """
  defmacro post(name, meta) do
    compile :post, resource_name: name, resource_meta: meta
  end

  @doc """
    This area becomes private
  """

  defp compile(method_type, [resource_name: name, resource_meta: meta]) do
    case method_type do
      :get  -> compile_get([resource_name: name, resource_meta: meta])
      :post -> compile_post([resource_name: name, resource_meta: meta])
      _     -> raise "possible invalid method_type, when trying to compile resource method"
    end
  end

  defp compile_get([resource_name: name, resource_meta: meta]) do
    unless meta[:from] do
      raise ":from, the url/endpoint of the resource, should always be defined"
    end

    env_signed = Application.get_env(:ex_dropbox, :authorize_resource)
    meta_signed = meta[:options][:signed]

    headers = %{}

    # unless meta_signed == false || env_signed == false do
    #   headers = %{"Authorization" => "Bearer 234831yhdaasb12asdh3248f"}
    # end

    # # dunno a better way to dynamically define functions...
    if meta[:segment] do
      quote do
        def unquote(:"#{name}")(segment, params \\ %{}) do
          ms = unquote(meta_signed)
          es = unquote(env_signed)

          # if none of the two are true, or one of them is true, sign request
          if ms == true || (es == true && ms == nil) || (es == nil && ms == nil) do
            headers = %{"Authorization" => "Bearer 234831yhdaasb12asdh3248f"}
          end

          # compose the url from the meta[:from] plus segment plus params(as query string)
          ExDropbox.Request.get(unquote(meta[:from]) <> segment, headers)
        end
      end
    else
      quote do
        def unquote(:"#{name}")(params \\ %{}) do
          ExDropbox.Request.get(unquote(meta[:from]), params)
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
