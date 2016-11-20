defmodule Koalog.PageController do
  use Koalog.Web, :controller

	plug :put_layout, "recipes.html"

  def index(conn, _params) do
  	conn
  	|> assign(:css, "http://css01.media-allrecipes.com/assets/deployables/v-1.45.0.2674/main-css.bundled.Css")
  	|> render("index.html")
  end
end
