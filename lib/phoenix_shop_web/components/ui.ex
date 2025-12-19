defmodule PhoenixShopWeb.Components.UI do
  use PhoenixShopWeb, :html

  slot :inner_block
  slot :subtitle
  def header(assigns)

  embed_templates "ui/*"
end
