defmodule Quicksort do
  def sort(list) when length(list) <= 1, do: list
  def sort(list) do
    {pivot, rest} = List.pop_at(list, 0)
    less = Enum.filter(rest, &(&1 <= pivot))
    greater = Enum.filter(rest, &(&1 > pivot))
    sort(less) ++ [pivot] ++ sort(greater)
  end
end

sorted = Quicksort.sort([10, 5, 2, 3])

Enum.each(sorted, &IO.write("#{&1} "))
IO.write("\n")
