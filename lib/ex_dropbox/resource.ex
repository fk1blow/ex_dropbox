defmodule ExDropbox.Resource do
  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  defmacro resource(description, do: block) do
    quote do
      def unquote(:"#{description}")(segment, params \\ %{}) when is_bitstring(segment) do
        url = unquote("#{block[:endpoint]}#{block[:path]}")
        if String.length(segment) > 0, do: url = url <> "/#{segment}"
      end

      def unquote(:"#{description}")(params \\ %{}) when :erlang.is_map(params) do
        url = unquote("#{block[:endpoint]}#{block[:path]}")
        if String.length(segment) > 0, do: url = url <> "/#{segment}"
      end
    end
  end
end
