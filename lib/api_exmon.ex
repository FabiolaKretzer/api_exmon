defmodule ApiExmon do
  alias ApiExmon.{Pokemon, Trainer}
  alias ApiExmon.Trainer.Pokemon, as: TrainerPokemon

  defdelegate create_trainer(trainer), to: Trainer.Create, as: :call
  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call
  defdelegate get_trainer(id), to: Trainer.Get, as: :call
  defdelegate update_trainer(id), to: Trainer.Update, as: :call

  defdelegate fetch_pokemon(name_pokemon), to: Pokemon.Get, as: :call

  defdelegate create_trainer_pokemon(trainer_pokemons), to: TrainerPokemon.Create, as: :call
  defdelegate delete_trainer_pokemon(id), to: TrainerPokemon.Delete, as: :call
end
