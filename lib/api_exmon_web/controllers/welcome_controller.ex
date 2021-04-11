defmodule ApiExmonWeb.WelcomeController do
  use ApiExmonWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to the ExMon API!!")
  end
end
