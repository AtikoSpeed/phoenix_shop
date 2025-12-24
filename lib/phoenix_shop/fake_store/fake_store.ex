defmodule PhoenixShop.FakeStore do
  def list_products do
    case Process.get(:products_cache) do
      nil ->
        products = Req.get!("https://fakestoreapi.com/products").body
        Process.put(:products_cache, products)
        products

      products ->
        products
    end
  end
end
