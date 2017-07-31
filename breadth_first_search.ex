defmodule BreadthFirstSearch do


  def search([], _searched), do: nil
  def search(list, searched) do
    results =
      Enum.each(list, fn(item) ->
        case is_seller(item) do
          true ->
            {:found, item}
          false ->
            r = (fn() -> search(graph()[item], [item |searched]) end)
        end
      end)
    cond Enum.any?(results, &({:found, name} = &1)) do
      true -> IO.puts("#{item} is mango seller")
      false -> Enum.each(results, &(&1.()))
    end
  end

  def searched?(list, person) do
    Enum.any?(list, &(person == &1))
  end


  def is_seller(name) do
    Regex.match?(~r/m$/, name)
  end

  def graph do
    %{
      "you" => ["alice", "bob", "claire"],
      "bob" => ["anuj", "peggy"],
      "alice" => ["peggy"],
      "claire" => ["thom", "jonny"],
      "anuj" => [],
      "peggy" => [],
      "thom" => [],
      "jonny" => []
    }
  end
end
