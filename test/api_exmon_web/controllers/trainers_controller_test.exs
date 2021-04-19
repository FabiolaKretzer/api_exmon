defmodule ApiExmonWeb.TrainersControllerTest do
 use ApiExmonWeb.ConnCase
 import ApiExmonWeb.Auth.Guardian

 alias ApiExmon.Trainer

 describe "show/2" do
  setup %{conn: conn} do
    params = %{name: "Name 1", password: "123456"}

    {:ok, trainer} = ApiExmon.create_trainer(params)

    {:ok, token, _claims} = encode_and_sign(trainer)

    conn = put_req_header(conn, "authorization", "Bearer #{token}")

    {:ok, conn: conn}
  end

  test "when there is a trainer with the given id, returns the trainer", %{conn: conn} do
    params = %{name: "Name 1", password: "123456"}

    {:ok, %Trainer{id: id}} = ApiExmon.create_trainer(params)

    response =
      conn
      |> get(Routes.trainers_path(conn, :show, id))
      |> json_response(:ok)

    assert %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Name 1"} = response
  end

  test "when there is an error, returns the error", %{conn: conn} do
    response =
      conn
      |> get(Routes.trainers_path(conn, :show, "1234"))
      |> json_response(:bad_request)

    assert response == %{"message" => "Invalid ID format!"}
  end
 end
end
