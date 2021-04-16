defmodule ApiExmon.Trainer.Pokemon.Create do
  alias ApiExmon.PokeApi.Client
  alias ApiExmon.Pokemon
  alias ApiExmon.{Repo, Trainer}
  alias ApiExmon.Trainer.Pokemon, as: TrainerPokemon

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Pokemon.build()
    |> fetch_trainer(params)
  end

  defp handle_response({:error, _msg} = error, _params), do: error

  defp fetch_trainer(pokemon, %{"trainer_id" => trainer_id} = params) do
    case Repo.get(Trainer, trainer_id) do
      nil -> {:error, "Trainer not found!"}
      _ -> create_pokemon(pokemon, params)
    end
  end

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
        "nickname" => nickname,
        "trainer_id" => trainer_id
      }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    params
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
