defmodule ApiExmonWeb.PokemonsController do
  use ApiExmonWeb, :controller

  action_fallback ApiExmonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ApiExmon.fetch_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error
end
