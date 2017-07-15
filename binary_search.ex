defmodule BinarySearch do
  def search(list, item, count \\ 0) when is_list(list) == true do
    count = count + 1
    {first_half, last_half} = split(list)
    guess = (List.last(first_half) || List.first(last_half))

    cond do
      item == guess ->
        IO.puts("Guess #{count}: #{guess}, found")
      item < guess ->
        IO.puts("Guess #{count}: #{guess}, too high")
        search(first_half, item, count)
      item > guess ->
        IO.puts("Guess #{count}: #{guess}, too low")
        search(last_half, item, count)
    end
  end

  defp split(list) do
    mid = div(length(list), 2)
    Enum.split(list, mid)
  end
end

list_size =
  "How many numbers?\n"
  |> IO.gets
  |> Integer.parse
  |> elem(0)

IO.puts("Creating list...")
list = Enum.to_list(1..list_size)

to_find =
  "What number should I find?\n"
  |> IO.gets
  |> Integer.parse
  |> elem(0)

max_steps =
  list_size
  |> :math.log2
  |> Float.ceil
  |> Float.to_string
  |> Integer.parse
  |> elem(0)


IO.puts "Using binary search, I can find your number in less than #{max_steps} steps. O(log n)"
IO.gets("Press <enter> to start")

BinarySearch.search(list, to_find)

