defmodule SalSupervisor do
use Supervisor

def start_link do
Supervisor.start_link(__MODULE__,[])
end

def init([]) do
children=[
worker(Salumiere,[])
]

supervise(children,strategy: :simple_one_for_one)
end
def creaSalumiere do
Supervisor.start_child(super_pid,[])
end

def chiudi(child_pid) do
Supervisor.terminate_child(super_pid, child_pid)
end
end
