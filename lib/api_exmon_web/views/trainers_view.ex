defmodule ApiExmonWeb.TrainersView do
  use ApiExmonWeb, :view

  alias ApiExmon.Trainer

  def render("create.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at},
        token: token
      }) do
    %{
      message: "Trainer created!",
      trainer: %{
        id: id,
        inserted_at: inserted_at,
        name: name
      },
      token: token
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{
      token: token
    }
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      id: id,
      inserted_at: inserted_at,
      name: name
    }
  end

  def render("update.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}}) do
    %{
      message: "Trainer updated!",
      trainer: %{
        id: id,
        inserted_at: inserted_at,
        name: name,
        updated_at: updated_at
      }
    }
  end
end
