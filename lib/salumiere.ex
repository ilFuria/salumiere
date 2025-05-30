defmodule Salumiere do

use GenServer
  def start_link(name) do
GenServer.start_link(__MODULE__,[], name: via_tuple(name))
  end
  def init(_) do
{:ok, 0}
end
  def attach(name) do
GenServer.call(via_tuple(name),{:attach})
  end
  def advance(name) do
GenServer.cast(via_tuple(name),{:pop})
  end
  def handle_call({:attach},_from, state) do
{:reply, state+1, state+1}
end
def handle_cast({:pop},0) do
IO.puts("Errore: coda nulla!")
{:noreply,0}
end
def handle_cast({:pop},state) when state>0 do
  {:noreply,state-1}
  end

defp via_tuple(name) do
{:via, Registry,{Salumiere.Registry,name}}
end
    end
