defmodule ApiExmonWeb.FallbackController do
  use ApiExmonWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ApiExmonWeb.ErrorView)
    |> render("401.json", result: "Trainer unauthorized!")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiExmonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
