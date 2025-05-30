defmodule AppSalumiere do
use Application

def start(_type,_args) do
children=[
{Registry, keys: :unique, name: Salumiere.Registry},
SalSupervisor]

opts=[strategy: :one_for_one, name: AppSalumiere.SalSupervisor]
Supervisor.start_link(children,opts)
end
end
