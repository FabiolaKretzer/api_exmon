defmodule ApiExmon do
  alias ApiExmon.Trainer

  defdelegate create_trainer(trainer), to: Trainer.Create, as: :call

  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call

  defdelegate get_trainer(id), to: Trainer.Get, as: :call

  defdelegate update_trainer(id), to: Trainer.Update, as: :call
end
