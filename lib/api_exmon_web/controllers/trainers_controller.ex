defmodule ApiExmonWeb.TrainersController do
  use ApiExmonWeb, :controller

  action_fallback ApiExmonWeb.FallbackController

  def create(conn, params) do
    params
    |> ApiExmon.create_trainer()
    |> handle_response(conn)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ApiExmon.delete_trainer()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |>text("")
  end

  defp handle_delete({:error, _changeset} = error, _conn), do: error

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error
end
