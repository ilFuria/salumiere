defmodule AppSalumiere do
use Application

def start(_type,_args) do
children=[
{Registry, keys: :unique, name: Cliente.Registry},
{Registry, keys: :unique, name: Salumiere.Registry},
SalumiereClientiRegistry,
ClienteSupervisor,
SalSupervisor
]

opts=[strategy: :one_for_one, name: AppSalumiere.SalSupervisor]
Supervisor.start_link(children,opts)
end
end
