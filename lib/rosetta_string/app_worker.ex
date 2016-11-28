defmodule RosettaString.AppWorker do
  def start_link do
    port = System.get_env("PORT") |> String.to_integer
    IO.puts("Starting Cowboy Elixir on port #{port} ...")
    Plug.Adapters.Cowboy.http(RosettaString.Router, [], port: port)
  end
end
