defmodule Bigflake.Base62 do
  @moduledoc false

  def encode(data, opts \\ []) do
    len = Keyword.get(opts, :length)
    data |> Base62.encode |> with_padding(len)
  end

  def decode(data) do
    data
    |> String.trim_leading("0")
    |> Base62.decode!
  end

  defp with_padding(data, nil), do: data
  defp with_padding(data, len), do: String.pad_leading(data, len, "0")
end
