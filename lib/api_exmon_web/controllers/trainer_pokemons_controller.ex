defmodule ApiExmonWeb.TrainerPokemonsController do
  use ApiExmonWeb, :controller

  action_fallback ApiExmonWeb.FallbackController

  def create(conn, params) do
    params
    |> ApiExmon.create_trainer_pokemon()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ApiExmon.delete_trainer_pokemon()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ApiExmon.fetch_trainer_pokemon()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ApiExmon.update_trainer_pokemon()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |>text("")
  end

  defp handle_delete({:error, _changeset} = error, _conn), do: error

  defp handle_response({:ok, pokemon}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
