defmodule Salumiere do

use GenServer
  def start_link do
GenServer.start_link(__MODULE__,[])
  end
  def init(_initData) do
{:ok, 0}
end
  def attach(process_id) do
GenServer.call(process_id,{:attach})
  end
  def advance(process_id) do
GenServer.cast(process_id),{:pop})
  end
  def handle_call({:attach},_from, state) do
  newstate=state+1
{:reply, newstate, newstate}
end
def handle_cast{{:pop},_from,state) do
  newstate=state-1
  {:noreply,newstate}
  end
    end
