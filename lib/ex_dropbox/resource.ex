defmodule ExDropbox.Resource do
  defmacro __using__(_opts) do
    quote do
      import ExDropbox.Resource
    end
  end

  # defmacro resource(description, do: block) do
  #   quote do
  #     defmodule unquote(String.to_atom(description)) do
  #       @name unquote(description)
  #     end
  #   end
  # end

  # defmacro get(description, [segments: segments, params: params]) do
  #   IO.puts "inside get"
  #   IO.inspect description
  # end

  # A more generic way to catch most of the variations
  defmacro get(description, attributes) do
    # IO.inspect attributes[:segments]
    # IO.inspect hd attributes
    # IO.inspect tl attributes

    quote do
      def unquote(String.to_atom(description))(params \\ %{}) do
        IO.puts "inside the first one :D"
        IO.inspect params
      end
    end
  end

  defmacro get(description) do
    # IO.inspect attributes[:segments]
    # IO.inspect hd attributes
    # IO.inspect tl attributes

    quote do
      def unquote(String.to_atom(description))() do
        IO.puts "inside the first one :D"
      end
    end
  end


  defmacro get(description, [segments: segments, params: params]) do
    quote do
      # ...here just to test some asumptions
      # defmodule unquote(String.to_atom("Metadata")) do
      #   @name unquote(description)
      # end

      if Enum.count(unquote(segments)) == 1 do
        def unquote(String.to_atom(description))(seg, params \\ %{}) do
          IO.puts "should have generate a Base.get() function call"
          IO.inspect unquote(segments)
          IO.inspect unquote(params)
        end
      end

      if Enum.count(unquote(segments)) == 0 || is_nil unquote(segments) do
        def unquote(String.to_atom(description))(params \\ %{}) do
          IO.puts "should have generate a Base.get() function call"
          IO.inspect unquote(params)
        end
      end
    end
  end
end

#   defmacro resource(description, do: block) do
#     quote do
#       def unquote(:"#{description}")(segment, params \\ %{}) when is_bitstring(segment) do
#         url = unquote("#{block[:endpoint]}#{block[:path]}")
#         if String.length(segment) > 0, do: url = url <> "/#{segment}"
#       end

#       def unquote(:"#{description}")(params \\ %{}) when :erlang.is_map(params) do
#         url = unquote("#{block[:endpoint]}#{block[:path]}")
#         if String.length(segment) > 0, do: url = url <> "/#{segment}"
#       end
#     end
#   end
