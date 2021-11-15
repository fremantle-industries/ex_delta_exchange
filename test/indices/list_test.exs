defmodule ExDeltaExchange.Indices.ListTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest ExDeltaExchange.Indices.List

  setup_all do
    HTTPoison.start()
    :ok
  end

  test ".get/1 ok" do
    use_cassette "indices/list/get_ok" do
      assert {:ok, indicies} = ExDeltaExchange.Indices.List.get()
      assert length(indicies) > 0
      assert %ExDeltaExchange.Index{} = index = Enum.at(indicies, 0)
      assert index.index_type != nil
    end
  end
end
