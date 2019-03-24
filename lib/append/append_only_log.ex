defmodule Append.AppendOnlyLog do
  defmacro __using__(_opts) do
    quote do
      @behaviour Append.AppendOnlyLog

    end
  end
end
