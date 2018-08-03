defmodule Food.Restaurants do
  alias Food.Restaurants.Venue
  alias Food.Repo

  def list_venues do
    Repo.all(Venue)
  end

  def change_venue(%Venue{} = venue) do
    Venue.changeset(venue, %{})
  end

  def create_venue(attrs \\ %{}) do
    %Venue{}
    |> Venue.changeset(attrs)
    |> Repo.insert()
  end
end
