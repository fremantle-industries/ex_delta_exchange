defmodule ExDeltaExchange.Products.ListTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest ExDeltaExchange.Products.List

  setup_all do
    HTTPoison.start()
    :ok
  end

  test ".get/1 ok" do
    use_cassette "products/list/get_ok" do
      assert {:ok, products} = ExDeltaExchange.Products.List.get()
      assert length(products) > 0
      assert %ExDeltaExchange.Product{} = product = Enum.at(products, 0)
      assert product.trading_status != nil
      assert product.underlying_asset != nil
      assert product.quoting_asset != nil
    end
  end
end
