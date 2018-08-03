defmodule FoodWeb.RestaurantController do
  use FoodWeb, :controller

  alias Food.Restaurants
  alias Food.Restaurants.Restaurant

  def index(conn, _params) do
    restaurants = Restaurants.list_restaurants()
    render(conn, "index.html", restaurants: restaurants)
  end

  def new(conn, _params) do
    changeset = Restaurants.change_restaurant(%Restaurant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"restaurant" => restaurant_params}) do
    case Restaurants.create_restaurant(restaurant_params) do
      {:ok, restaurant} ->
        conn
        |> put_flash(:info, "#{restaurant.name} created!")
        |> redirect(to: Routes.restaurant_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
