defmodule Showcase do
  def flatten(array_of_arrays) do
    Enum.flat_map array_of_arrays, fn(x) -> x end
  end

  def flatten_reduce(range, stoppage \\ 5) do
    Enum.flat_map_reduce(range, 0,
      fn(i, acc) ->
       if i < stoppage do
        {[i], acc + i}
       else
         {:halt, acc}
       end
    end)
  end

  def colon_delimit(range) do
    Enum.intersperse(range, ":")
  end

  def explains_scan(range) do
    Enum.scan(range, &([&2, &1]))
  end
end
