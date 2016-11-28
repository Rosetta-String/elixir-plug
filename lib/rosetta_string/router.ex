defmodule RosettaString.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("x-powered-by", "elixir/plug")
    |> send_resp(200, "Elixir/Plug Rosetta says hello!")
  end

  get "/random" do
    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("x-powered-by", "elixir/plug")
    |> send_resp(200, "random")
  end

  post "/create" do
    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("x-powered-by", "elixir/plug")
    |> send_resp(200, "Hello, world!")
  end

  get "/for/:name" do
    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("x-powered-by", "elixir/plug")
    |> send_resp(200, "Hello, #{name}!")
  end

  match _ do
    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("x-powered-by", "elixir/plug")
    |> send_resp(404, "Couldn't find that page, sorry!")
  end

end
