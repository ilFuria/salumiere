defmodule SalSupervisor do
use DynamicSupervisor

  def start_link do
DynamicSupervisor.start_link(__MODULE__,:ok,name: __MODULE__)
  end

  def init(:ok) do
DynamicSupervisor.init(strategy: :one_for_one)
end
  def crea do
spec=%{
  id: Salumiere,
  start: {Salumiere, :start_link, []},
  restart: :transient,
  type: :worker
}
DynamicSupervisor.start_child(__MODULE__,spec)
  end

  def chiudi(pid) do
Supervisor.terminate_child(__MODULE__, pid)
  end
  end
