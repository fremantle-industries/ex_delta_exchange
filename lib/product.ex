defmodule ExDeltaExchange.Product do
  @type t :: %__MODULE__{
    id: non_neg_integer,
    symbol: String.t(),
    description: String.t(),
    created_at: String.t(),
    updated_at: String.t(),
    settlement_time: String.t(),
    notional_type: String.t(),
    impact_size: 0,
    initial_margin: 0,
    maintenance_margin: String.t(),
    contract_value: String.t(),
    contract_unit_currency: String.t(),
    tick_size: String.t(),
    product_specs: map,
    state: String.t(),
    trading_status: String.t(),
    max_leverage_notional: String.t(),
    default_leverage: String.t(),
    initial_margin_scaling_factor: String.t(),
    maintenance_margin_scaling_factor: String.t(),
    taker_commission_rate: String.t(),
    maker_commission_rate: String.t(),
    liquidation_penalty_factor: String.t(),
    contract_type: String.t(),
    position_size_limit: non_neg_integer,
    basis_factor_max_limit: String.t(),
    is_quanto: boolean,
    funding_method: String.t(),
    annualized_funding: String.t(),
    price_band: String.t(),
    underlying_asset: map,
    quoting_asset: map,
    settling_asset: map,
    spot_index: map
  }

  defstruct ~w[
    id
    symbol
    description
    created_at
    updated_at
    settlement_time
    notional_type
    impact_size
    initial_margin
    maintenance_margin
    contract_value
    contract_unit_currency
    tick_size
    product_specs
    state
    trading_status
    max_leverage_notional
    default_leverage
    initial_margin_scaling_factor
    maintenance_margin_scaling_factor
    taker_commission_rate
    maker_commission_rate
    liquidation_penalty_factor
    contract_type
    position_size_limit
    basis_factor_max_limit
    is_quanto
    funding_method
    annualized_funding
    price_band
    underlying_asset
    quoting_asset
    settling_asset
    spot_index
  ]a
end
