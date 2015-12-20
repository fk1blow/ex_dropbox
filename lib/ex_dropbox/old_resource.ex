defmodule ExDropbox.Resource do
  @moduledoc """
    It imports every module needed by a resource and adds
    a set of utility functions that will process a resource response
  """

  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Api.Base
      import ExDropbox.Api.Endpoints
      import ExDropbox.Resource
    end
  end

  defmacro resource(name, do: block) do
    function_name = String.to_atom(name)
    quote do
      @doc "def user_info(), do: get(....)"
      def unquote(function_name)() do
        get(unquote(:"#{block[:host]}_hostname")(),
          "#{unquote(block[:url_path])}")
      end

      @doc "def user_info(url_segment), do: get(....)"
      def unquote(function_name)(url_segment) do
        get(unquote(:"#{block[:host]}_hostname")(),
          "#{unquote(block[:url_path])}#{url_segment}")
      end

      @doc "def user_info(url_segment, params), do: get(....)"
      def unquote(function_name)(url_segment, params) do
        get(unquote(:"#{block[:host]}_hostname")(),
          "#{unquote(block[:url_path])}#{url_segment}")
      end
    end
  end
end
