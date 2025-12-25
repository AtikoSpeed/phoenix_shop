# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixShop.Repo.insert!(%PhoenixShop.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixShop.Repo
alias PhoenixShop.Store.Product

# Fetch from FakeStore API
products = Req.get!("https://fakestoreapi.com/products").body

# Insert each product
for p <- products do
  Repo.insert!(%Product{
    title: p["title"],
    price: p["price"] * 1.0,
    description: p["description"],
    category: p["category"],
    image: p["image"],
    rating: p["rating"]["rate"] * 1.0,
    rating_count: p["rating"]["count"]
  })
end

IO.puts("Seeded #{length(products)} products")
