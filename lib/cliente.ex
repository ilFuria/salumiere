defmodule Cliente do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: via_tuple(name))
  end

  def init(_) do
    {:ok, 0}
  end

  def accodati(name, numero) do
    GenServer.cast(via_tuple(name), {:accodati, numero})
  end

  def handle_cast({:accodati, numero}, _state) do
    {:noreply, numero}
  end

  def handle_info({:avanti, _nome}, stato) when stato > 1 do
    {:noreply, stato - 1}
  end

  def handle_info({:avanti, nome}, 1) do
    SalumiereClientiRegistry.deregistra(nome)
    {:stop, :normal, 0}
  end

  defp via_tuple(name) do
    {:via, Registry, {Cliente.Registry, name}}
  end
end
