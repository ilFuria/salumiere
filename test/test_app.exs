defmodule ClienteTerminazioneTest do
  use ExUnit.Case

  alias SalSupervisor
  alias ClienteSupervisor
  alias Cliente
  alias Salumiere
  alias SalumiereClientiRegistry

  setup do
    :ok
  end

  test "cliente con stato 1, dopo advance muore ed è rimosso dal registro" do
    # 1. Creo un salumiere
     SalSupervisor.crea("gino")

    # 2. Creo un cliente accodato al salumiere "gino"
     ClienteSupervisor.crea("gianni", "gino")

    # 3. Imposto lo stato del cliente a 1
     ClienteSupervisor.crea("mino", "gino")

    # 5. Faccio advance (che manda :avanti → cliente va a 0 e muore)
    Salumiere.advance("gino")

    # 6. Aspetto che il messaggio venga gestito e il processo termini
    Process.sleep(50)

    # 7. Controllo che il cliente non sia più nel registro

    # 8. Controllo che il processo del cliente non esista più
    assert Registry.lookup(Cliente.Registry, "gianni") == []
  end
end
