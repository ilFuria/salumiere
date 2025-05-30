defmodule SalSupervisor do
use DynamicSupervisor

  def start_link(_) do
DynamicSupervisor.start_link(__MODULE__,:ok,name: __MODULE__)
  end

  def init(:ok) do
DynamicSupervisor.init(strategy: :one_for_one)
end
  def crea(name) do
spec=%{
  id: Salumiere,
  start: {Salumiere, :start_link, [name]},
  restart: :transient,
  type: :worker
}
DynamicSupervisor.start_child(__MODULE__,spec)
  end

  def chiudi(name) do
case Registry.lookup(Salumiere.Registry,name) do
[{pid,_value}]->
DynamicSupervisor.terminate_child(__MODULE__, pid)
[] ->
{:error, :not_found}
end
  end
  end
