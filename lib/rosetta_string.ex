defmodule RosettaString do
  use Application
  
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
  
    children = [
      worker(RosettaString.AppWorker, [])
    ]
  
    opts = [strategy: :one_for_one, name: RosettaString.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
