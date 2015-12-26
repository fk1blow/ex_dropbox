defmodule SK.Maybe do
  @moduledoc """
    Naive Maybe monad attempt
  """

  @doc """
    Creates a new Maybe
  """
  def from(value) when is_nil(value), do: {:none, nil}
  def from(value), do: {:some, value}

  @doc """
    Map over the maybe, applying the value to the provided callback function,
    or does nothing, if {:none, nil}
  """
  def map({:none, nil}, callback), do: {:none, nil}
  def map({:some, value}, callback), do: SK.Maybe.from(callback.(value))

  @doc """
    Transforms into a plain value if {:none, nil}, or simply returns the some
  """
  def or_else({:none, nil}, callback), do: callback.(nil)
  def or_else({:some, value}, callback), do: {:some, value}

  @doc """
    Extract the value of the `Maybe`
  """
  def get({:none, _}), do: nil
  def get({:some, value}), do: value
  def get(value), do: value
end
