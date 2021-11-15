defmodule ExDeltaExchange.Assets.ListTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest ExDeltaExchange.Assets.List

  setup_all do
    HTTPoison.start()
    :ok
  end

  @valid_credentials %ExDeltaExchange.Credentials{
    api_key: System.get_env("DELTA_EXCHANGE_API_KEY"),
    api_secret: System.get_env("DELTA_EXCHANGE_API_SECRET")
  }
  @invalid_credentials %ExDeltaExchange.Credentials{
    api_key: "invalid",
    api_secret: "invalid"
  }

  test ".get/1 ok" do
    use_cassette "assets/list/get_ok" do
      assert {:ok, assets} = ExDeltaExchange.Assets.List.get(@valid_credentials)
      assert length(assets) > 0
      assert %ExDeltaExchange.Asset{} = market = Enum.at(assets, 0)
      assert market.deposit_status != nil
    end
  end

  test ".get/1 invalid credentials" do
    use_cassette "assets/list/get_unauthorized" do
      assert ExDeltaExchange.Assets.List.get(@invalid_credentials) == {:error, %{"code" => "invalid_api_key"}}
    end
  end
end
