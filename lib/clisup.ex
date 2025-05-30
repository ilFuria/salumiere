defmodule ClienteSupervisor do
use DynamicSupervisor

  def start_link(_) do
DynamicSupervisor.start_link(__MODULE__,:ok,name: __MODULE__)
  end

  def init(:ok) do
DynamicSupervisor.init(strategy: :one_for_one)
end
  def crea(cliente, salumiere) do
spec=%{
  id: Cliente,
  start: {Cliente, :start_link, [cliente]},
  restart: :transient,
  type: :worker
}
DynamicSupervisor.start_child(__MODULE__,spec)
  posizione=Salumiere.attach(salumiere)
  Cliente.accodati(cliente,posizione)
SalumiereClientiRegistry.registra(cliente, salumiere)
  end

def chiudi(name) do
  case Registry.lookup(Cliente.Registry,name) do
  [{pid,_value}]->
DynamicSupervisor.terminate_child(__MODULE__, pid)
  [] ->
{:error, :not_found}
end
end
end
