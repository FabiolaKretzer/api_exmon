defmodule ApiExmon do
  alias ApiExmon.Trainer

  defdelegate create_trainer(trainer), to: Trainer.Create, as: :call

  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call
end
