# Food

_demo for [Programming Phoenix 1.4](http://www.pragmaticprogrammer.com/titles/phoenix14), Chapter 4: Ecto and Changesets_

## Exercise

Create a Restaurants app that stores info on all the tastiest restaurants near our new HQ.

Some inspiration (Johnny's recs):  
- https://docs.google.com/spreadsheets/d/1gPLtLUPJJzL5P5q116PlvnngiAKTE9AiF9Ig3-YMZF0/edit?usp=sharing
- https://www.google.com/maps/d/viewer?mid=1n0fo2E54L7tkP4DLPpQpzaPuDBZRS15H&hl=en&usp=sharing

### Spec:

- Elixir app that uses Ecto + Postgres
- `restaurants#index` that lists all restaurants
- `restaurants#new` with form for entering new restaurant

## Walkthrough

1. Spin up new app

```
$ mix phx.new food
$ cd food
$ mix ecto.create

$ mix phx.server
OR
$ iex -S mix phx.server
```

2. Create context `Food.Restaurants`
3. Create schema `Food.Restaurants.Restaurant`
4. Create and run migration

```
mix ecto.gen.migration create_restaurants
mix ecto.migrate
```

5. Create data manually

```
iex -S mix

iex(1)> alias Food.Repo
Food.Repo
iex(2)> alias Food.Restaurants.Restaurant
Food.Restaurants.Restaurant
iex(3)> Repo.insert(%Restaurant{
...(3)> name: "Sweetgreen", address: "8 E 18th St, New York, NY 10003"
...(3)> })
[debug] QUERY OK db=15.1ms
INSERT INTO "restaurants" ("address","name","inserted_at","updated_at") VALUES ($1,$2,$3,$4) RETURNING "id" ["8 E 18th St, New York, NY 10003", "Sweetgreen", {{2018, 8, 3}, {3, 32, 26, 64503}}, {{2018, 8, 3}, {3, 32, 26, 68225}}]
{:ok,
 %Food.Restaurants.Restaurant{__meta__: #Ecto.Schema.Metadata<:loaded, "restaurants">,
  address: "8 E 18th St, New York, NY 10003", id: 1,
  inserted_at: ~N[2018-08-03 03:32:26.064503], name: "Sweetgreen",
  updated_at: ~N[2018-08-03 03:32:26.068225]}}
```

6. Create `restaurants#index`
  - Create `FoodWeb.RestaurantController`
  - Create `index` route in `Router.ex`
  - Create `index_view.ex` view
  - Create `index.html.eex` template

7. Create `restaurants#new` with form for adding new restaurants
  - Create `new`, `create` routes in `Router.ex`
  - Create `new.html.eex` template

8. Bask in glory


## Resources

1. [Ecto](https://hexdocs.pm/ecto/Ecto.html)
2. [Ecto.Repo](https://hexdocs.pm/ecto/Ecto.Repo.html)
3. [Ecto.Query](https://hexdocs.pm/ecto/Ecto.Query.html)
4. [List of Elixir ORMs, data mappings](https://github.com/h4cc/awesome-elixir#orm-and-datamapping](https://github.com/h4cc/awesome-elixir#orm-and-datamapping)
5. [Daily Drip Ecto tutorial](https://www.dailydrip.com/topics/elixir/drips/ecto-basics)
6. [Brad Urani, "ActiveRecord vs. Ecto: A Tale of Two ORMs" (RailsConf 2016)](https://youtu.be/_wD25uHx_Sw)
