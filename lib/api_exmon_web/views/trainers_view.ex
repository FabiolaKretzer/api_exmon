defmodule ApiExmonWeb.TrainersView do
  use ApiExmonWeb, :view

  alias ApiExmon.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Trainer created!",
      trainer: %{
        id: id,
        inserted_at: inserted_at,
        name: name
      }
    }
  end
end
