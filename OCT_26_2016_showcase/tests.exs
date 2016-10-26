Code.load_file("modules.exs", __DIR__)
ExUnit.start()
ExUnit.configure trace: true

defmodule Tests do
  use ExUnit.Case
  # flatten
  test "flattens arrays of arrays" do
    list = [[1,2],[3,4], [5]]
    new_list = Showcase.flatten(list)
    assert new_list == [1, 2, 3, 4, 5]
  end

  test "only flattens one level" do
    list = [[[1, 2]], [[3,4]]]
    assert Showcase.flatten(list) == [[1,2], [3,4]]
  end

  test "returns array and sum" do
    assert Showcase.flatten_reduce(0..5) === {[0, 1, 2, 3, 4], 10}
  end

  test "stops if any items are more than five" do
    assert Showcase.flatten_reduce(0..10) == {[0, 1, 2, 3, 4], 10}
  end

  test "puts a colon in between each element" do
    assert Showcase.colon_delimit(0..3) == [0, ":", 1, ":", 2, ":", 3]
  end

  test "creates_nonsense" do
    assert Showcase.explains_scan(0..3) == [0, [0, 1], [[0, 1], 2], [[[0, 1], 2], 3]]
  end
end
