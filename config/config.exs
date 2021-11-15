use Mix.Config

# config :ex_delta_exchange, domain: "testnet-api.delta.exchange"
config :ex_delta_exchange, domain: "api.delta.exchange"
config :ex_delta_exchange, api_key: System.get_env("DELTA_EXCHANGE_API_KEY")
config :ex_delta_exchange, api_secret: System.get_env("DELTA_EXCHANGE_API_SECRET")

config :exvcr,
  filter_request_headers: [
    "api-key",
    "signature",
    "timestamp"
  ],
  response_headers_blacklist: [
    "CF-RAY"
  ]
