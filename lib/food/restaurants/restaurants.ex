defmodule Food.Restaurants do
  alias Food.Restaurants.Restaurant
  alias Food.Repo

  def list_restaurants do
    Repo.all(Restaurant)
  end

  def change_restaurant(%Restaurant{} = restaurant) do
    Restaurant.changeset(restaurant, %{})
  end

  def create_restaurant(attrs \\ %{}) do
    %Restaurant{}
    |> Restaurant.changeset(attrs)
    |> Repo.insert()
  end
end
