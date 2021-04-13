defmodule ApiExmonWeb.TrainersController do
  use ApiExmonWeb, :controller

  action_fallback ApiExmonWeb.FallbackController

  def create(conn, params) do
    params
    |> ApiExmon.create_trainer()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ApiExmon.delete_trainer()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ApiExmon.get_trainer()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ApiExmon.update_trainer()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |>text("")
  end

  defp handle_delete({:error, _changeset} = error, _conn), do: error

  defp handle_response({:ok, trainer}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
