defmodule Router do
  defmacro __using__(_opts) do
    quote do
      def init(default_opts) do
        IO.puts "starting up router..."
        default_opts
      end

      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end

defmodule RosettaString do
  use Router

  def route("GET", [""], conn) do
    conn |> Plug.Conn.send_resp(200, "Hello, world!")
  end

  def route("GET", ["for", name], conn) do
    conn |> Plug.Conn.send_resp(200, "Hello, #{name}!")
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end

end
