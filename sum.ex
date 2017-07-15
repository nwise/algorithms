defmodule Sum do

  def sum(l, acc \\ 0)
  def sum([], acc), do: acc
  def sum([head | tail], acc) do
    sum(tail, (head + acc))
  end

end

sum = Sum.sum([1,2,3,4])

IO.puts(sum)

