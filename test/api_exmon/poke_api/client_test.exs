defmodule ApiExmon.PokeApi.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  alias ApiExmon.PokeApi.Client

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  describe "get_pokemon/1" do
    test "when there is a pokemon with the given name, returns the pokemon" do
      body = %{"name" => "pikachu", "weitht" => 60, "types" => ["electric"]}

      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        %Tesla.Env{status: 200, body: body}
      end)

      response = Client.get_pokemon("pikachu")

      assert response == {:ok, %{"name" => "pikachu", "types" => ["electric"], "weitht" => 60}}
    end

    test "when there no pokemon with the given name, returns the error" do
      mock(fn %{method: :get, url: @base_url <> "invalid"} ->
        %Tesla.Env{status: 404}
      end)

      response = Client.get_pokemon("invalid")

      assert response == {:error, "Pokemon not found!"}
    end

    test "when there an unexpected error, returns the error" do
      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        {:error, :timeout}
      end)

      response = Client.get_pokemon("pikachu")

      assert response == {:error, :timeout}
    end
  end
end
